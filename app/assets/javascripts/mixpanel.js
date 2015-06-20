$(document).on('page:change', function () {
  mixpanel.track_links("#addphoto", "Clicked: Floating Add Photo Button");
});
