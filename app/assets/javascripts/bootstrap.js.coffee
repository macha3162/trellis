jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('.alert').delay(3000).fadeOut("slow");
  $('.best_in_place').best_in_place();
