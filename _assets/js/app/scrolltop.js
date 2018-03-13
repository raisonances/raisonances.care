$(document).ready(function() {
  $('#scroll-top').hide();

  $('#scroll-top').on('click', function($event) {
    $event.preventDefault();
    $event.stopPropagation();
    $('html, body').animate({ scrollTop: 0 });
  });

  $(window).on('scroll', function($event) {
    var pos = $(window).scrollTop();
    var trigger = $(window).height() / 2;
    if(pos < trigger) {
      $('#scroll-top').hide();
    } else {
      $('#scroll-top').show();
    }
  });
});
