function scrollToAnchor() {
	$('a[class^=scroll-]').on('click',function(e) {
	    e.preventDefault();
	    var target = this.hash;
	    var $target = $(target);

	    $('html, body').stop().animate({
	        'scrollTop': $target.offset().top
	    }, 900, 'swing', function () {
	        window.location.hash = target;
	    });
	});
}

$(document).ready(function() {
  scrollToAnchor();
});
