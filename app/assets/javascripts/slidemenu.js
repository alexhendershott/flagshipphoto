$(window).load(function(){
  $("#nav-toggle").click(function(){
    $( "#side-nav" ).animate({
      opacity: 1,
      left: "+=240",
    }, 250, function() {
      // Animation complete.
    });
  });
  $('body').on('click',function(event){
   if(!$(event.target).is('#nav-toggle')){
     $( "#side-nav" ).animate({
       opacity: 1,
       left: "+=-240",
     }, 250, function() {
       // Animation complete.
     });
   }
  });
});
