require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "/feed.xml", layout: false


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Blog settings
###
activate :directory_indexes

Time.zone = "Paris"
I18n.config.enforce_available_locales = false

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
 # blog.prefix = "blog"
   blog.name = "blog"
   blog.permalink = "/blog/{year}-{month}-{day}-{title}.html"
 # Matcher for blog source files
   blog.sources = "/blog/{year}-{month}-{day}-{title}.html"
 # blog.taglink = "tags/{tag}.html"
   blog.layout = "layouts/blog"
 # blog.summary_separator = /()/
 # blog.summary_length = 250
 # blog.year_link = "{year}.html"
 # blog.month_link = "{year}/{month}.html"
 # blog.day_link = "{year}/{month}/{day}.html"
   blog.default_extension = ".markdown"

 # blog.new_article_template = "sources/new-article.html.markdown"

 # blog.tag_template = "tag.html"
 # blog.calendar_template = "calendar.html"

 # Enable pagination
   blog.paginate = true
   blog.per_page = 20
   blog.page_link = "/{num}"

 # Custom categories
   blog.custom_collections = {
     category: {
       link: '/categories/{category}.html',
       template: '/category.html'
     }
   }
end

page "/feed.xml", layout: false


# Disqus commentaires

activate :disqus do |d|
  d.shortname = 'donpadre' # Remplacer par votre nom Disqus 
end



# General configuration

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
    deploy.branch   = 'master' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
    deploy.build_before = true
end

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
    result = data.authors.select {|author| author.keys.first == author_slug }
    raise ArgumentError unless result.any?
    result.first
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
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript4
end
