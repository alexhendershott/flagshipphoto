$(document).on('page:change', function () {
   $(window).scroll(function() {
    if ($(this).scrollTop()>185)
     {
        $('.btn-add-home').hide();
        $('.btn-add-nav').show();
     }
    else
     {
      $('.btn-add-home').show();
      $('.btn-add-nav').hide();
      $('.imageSingle .btn-add-nav').show();
     }
 });
});
