$(document).on('page:change', function () {
  $("#nav-toggle").click(function(){
    $( "#side-nav" ).animate({
      opacity: 1,
      left: "+=240",
    }, 250, function() {
      // Animation complete.
    });
    $('.overlay').show();
    $('.btn-add-home').css('z-index','1000');
  });
  $(".overlay").click(function(){
    $( "#side-nav" ).animate({
      opacity: 1,
      left: "-=240",
    }, 250, function() {
      // Animation complete.
    });
    $('.overlay').hide();
    $('.btn-add-home').css('z-index','1031');
  });
});
