require 'slim'
require 'kramdown'
###
# Page options, layouts, aliases and proxies
###

data.authors.collect { |author| author.keys.first }.each do |author_slug|
    proxy "/authors/#{author_slug}.html",
          '/authors/template.html',
          locals: { author_slug: author_slug },
          ignore: true
end

# Per-page layout changes:
#
# With no layout
page '/feed.xml', layout: false
page '/sitemap.xml', layout: false
page '/merci.html',  directory_index: false
page '/404.html',    directory_index: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Blog settings
###

Time.zone = 'Paris'
I18n.config.enforce_available_locales = false

activate :blog do |blog|
    # This will add a prefix to all links, template references and source paths
    # blog.prefix = "blog"
    blog.name = 'blog'
    blog.permalink = '/blog/{year}-{month}-{day}-{title}.html'
    # Matcher for blog source files
    blog.sources = '/blog/{year}-{month}-{day}-{title}.html'
    # blog.taglink = "tags/{tag}.html"
    blog.layout = 'layouts/blog'
    # blog.summary_separator = /()/
    # blog.summary_length = 250
    # blog.year_link = "{year}.html"
    # blog.month_link = "{year}/{month}.html"
    # blog.day_link = "{year}/{month}/{day}.html"
    blog.default_extension = '.markdown'

    # blog.new_article_template = 'source/new-article.html.markdown'

    # blog.tag_template = "tag.html"
    # blog.calendar_template = "calendar.html"

    # Enable pagination
    blog.paginate  = true
    blog.per_page  = 10
    blog.page_link = '/{num}'

    # Custom categories
    blog.custom_collections = {
        category: {
            link: '/categories/{category}.html',
            template: '/category.html'
        }
    }
end

# Disqus commentaires
activate :disqus do |d|
    d.shortname = 'donpadre' # Remplacer par votre nom Disqus
end

# Autoprefixer
activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 9']
end

activate :directory_indexes

activate :protect_emails

# General configuration

activate :deploy do |deploy|
    deploy.deploy_method = :git
    # Optional Settings
    # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
    deploy.branch = 'master' # default: gh-pages
    # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
    # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
    deploy.build_before = true
end

# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
    activate :livereload
end

###
# Helpers
###
helpers do
    def find_author(author_slug)
        author_slug = author_slug.downcase
        result = data.authors.select { |author| author.keys.first == author_slug }
        raise ArgumentError unless result.any?
        result.first
    end

    def articles_by_author(author)
        sitemap.resources.select do |resource|
            resource.data.author == author.name
        end.sort_by { |resource| resource.data.date }
    end

    def author_path(author)
        "/authors/#{author.keys.first}"
    end

    # Retina
    def retina_image(file_name)
        file_name.sub(/\.(jpg|png|gif|webp)/, '@2x.\\1') if file_name
    end

    def set_hero_image(image)
        styles = %{<style>.header{background-image: url('/images/backgrounds/small/#{image}');}
        @media screen and (min-width: 25em){.header{background-image: url('/images/backgrounds/medium/#{image}');}}
        @media screen and (min-width: 50em){.header{background-image: url('/images/backgrounds/#{image}');}}</style>}
        styles
    end

    def image_res(path, params = {})
        blog_prefix = blog_controller.try(:options).try(:prefix).try(:gsub, '/', '')
        if current_path =~ /^#{blog_prefix}/
            classes = params[:class].try(:split, ' ') || []
            classes << 'responsive__img'
        end
        params[:class] = classes.try(:join, '')
        super(path, params)
    end
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
    # Favicon
    activate :favicon_maker do |f|
        f.template_dir = File.join(root, 'source')
        f.output_dir = File.join(root, 'build')
        f.icons = {
            '_favicon_template.png' => [
                { icon: 'apple-touch-icon-152x152-precomposed.png' },
                { icon: 'apple-touch-icon-144x144-precomposed.png' },
                { icon: 'apple-touch-icon-120x120-precomposed.png' },
                { icon: 'apple-touch-icon-114x114-precomposed.png' },
                { icon: 'apple-touch-icon-76x76-precomposed.png' },
                { icon: 'apple-touch-icon-72x72-precomposed.png' },
                { icon: 'apple-touch-icon-60x60-precomposed.png' },
                { icon: 'apple-touch-icon-57x57-precomposed.png' },
                { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
                { icon: 'apple-touch-icon.png', size: '57x57' },
                { icon: 'favicon-196x196.png' },
                { icon: 'favicon-160x160.png' },
                { icon: 'favicon-96x96.png' },
                { icon: 'favicon-32x32.png' },
                { icon: 'favicon-16x16.png' },
                { icon: 'favicon.png', size: '16x16' },
                { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
                { icon: 'mstile-144x144', format: 'png' }
            ]
        }
    end
end

# Minification
# activate :minify_css
# activate :minify_javascript
# activate :minify_html, remove_input_attributes: false

# Use relative URLs
activate :relative_assets

# Site map
# activate :sitemap, hostname: data.settings.site.url
set :url_root, 'http://donpadre.github.io'

activate :search_engine_sitemap

# activate :gzip
# Gzip compression
activate :gzip
