
$(function () {

	var filterList = {

		init: function () {

			// MixItUp plugin
			// http://mixitup.io
			$('#portfoliolist').mixItUp({
				selectors: {
  			  target: '.folio',
  			  filter: '.filter'
  		  },
  		  load: {
    		  filter: '.app, .card, .icon, .ill, .logotype, .web' // show app tab on first load
    		}
			});

		}

	};

	// Run the show!
	filterList.init();

});
/////////////////////// Portfolio fin //////////////////////////////

///////////////////// Compétence developpement  debut ////////////////////////
  $( document ).ready(function() {
  // Main variables
    var $aboutTitle = $('.about-myself .content h2');
    var $developmentWrapper = $('.development-wrapper');
    var developmentIsVisible = false;
    var middle_of_developmentWrapper = $developmentWrapper.offset().top + $developmentWrapper.outerHeight()/2;

    if((bottom_of_window > middle_of_developmentWrapper)&& (developmentIsVisible == false)){

      $('.skills-bar-container li').each( function(){

        var $barContainer = $(this).find('.bar-container');
        var dataPercent = parseInt($barContainer.data('percent'));
        var elem = $(this).find('.progressbar');
        var percent = $(this).find('.percent');
        var width = 0;

        var id = setInterval(frame, 15);

        function frame() {
          if (width >= dataPercent) {
              clearInterval(id);
          } else {
            width++;
            elem.css("width", width+"%");
            percent.html(width+" %");
          }
        }
      });
      developmentIsVisible = true;
    }
  });
///////////////////// Compétence developpement  fin ////////////////////////
