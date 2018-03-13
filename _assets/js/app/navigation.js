$(document).ready(function() {
  var container = $('html, body');

  $('.scroll-to').on('click', function($event) {
    $event.stopPropagation();
    $event.preventDefault();

    var targetId = $(this).attr('href');
    container.animate({ scrollTop: $(targetId).offset().top - 40 });
  });

  $('.toggle-navigation-overlay').on('click', function($event) {
    $event.stopPropagation();
    $event.preventDefault();

    var element = $(this);
    var targetId = element.attr('href');
    var target = $(targetId);
    var action = element.data('action');

    function toggleNavigationOverlay() {
      switch(action) {
        case 'hide':
          target.removeClass('active');
          container.css({ overflow: 'auto' });
          break;
        case 'show':
          target.addClass('active');
          container.css({ overflow: 'hidden' });
          break;
      }
    }

    if($(window).scrollTop() > 0) {
      container.animate({ scrollTop: 0 }, toggleNavigationOverlay);
    } else {
      toggleNavigationOverlay();
    }
  });
});
