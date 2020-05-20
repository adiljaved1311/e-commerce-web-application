/*
My Custom JS
============
*/

// create the back to top button
$(document).ready(function(){
    $("#login").click(function(){
        $("#myModal").modal();
    });
});
$(document).ready(function(){
    $("#signup").click(function(){
        $("#myModal1").modal();
    });
});
$(document).ready(function(){
    $("#editprofile").click(function(){
        $("#edit").modal();
    });
});
$(document).ready(function(){
    $("#changepassword").click(function(){
        $("#password").modal();
    });
});
/*$('body').prepend('<a href="#" class="back-to-top">Back to Top</a>');

var amountScrolled = 200;

$(window).scroll(function() {
	if ( $(window).scrollTop() > amountScrolled ) {
		$('a.back-to-top').fadeIn('slow');
	} else {
		$('a.back-to-top').fadeOut('slow');
	}
});

$('a.back-to-top').click(function() {
	$('html, body').animate({
		scrollTop: 0
	}, 700);
	return false;
});

// create main carousel
var $ = jQuery.noConflict();
$(document).ready(function() 
{ 
	$('#myCarousel').carousel({ interval: 3000, cycle: true });
}); 

// create Success carousel	
var $ = jQuery.noConflict();
$(document).ready(function() 
{ 
	$('#Success-Carousel').carousel({ interval: 5000, cycle: true });
}); 

// create scroll animation
jQuery(document).ready(function() {
	jQuery('.animation').viewportChecker({
		classToAdd: 'visible animated bounceIn', 
		offset: 100    
	   });
});*/

