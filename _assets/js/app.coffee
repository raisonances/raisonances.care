requirejs.config
  baseUrl: '/assets'
  paths:
    bootstrap: 'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min'
    jquery: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min'
    modernizr: 'https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min'
  shim:
    bootstrap: [ 'jquery' ]

require [ 'modernizr', 'bootstrap' ], ->
  $(document).ready ->
    $('.scrollr').on 'click', ($event) ->
      TargetId = $(this).attr('href')
      $event.stopPropagation()
      $event.preventDefault()
      $('html, body').animate
        scrollTop: $(TargetId).offset().top
      return
    return
  return
