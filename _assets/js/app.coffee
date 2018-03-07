requirejs.config
  baseUrl: '/assets'
  paths:
    bootstrap: 'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min'
    jquery: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min'
    modernizr: 'https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min'
  shim:
    bootstrap: [ 'jquery' ]

require [ 'modernizr', 'bootstrap' ], ->
  Page = $('html, body')

  # navigation overlay
  ToggleNavigationOverlay = ($event) ->
    Element = $(this)
    TargetId = Element.attr('href')
    Target = $(TargetId)
    Action = Element.data('action')
    $event.stopPropagation()
    $event.preventDefault()
    if $(window).scrollTop() isnt 0
      Page.animate { scrollTop: 0 }, ->
        switch Action
          when 'hide'
            Target.removeClass 'active'
            Page.css { overflow: 'auto' }
          when 'show'
            Target.addClass 'active'
            Page.css { overflow: 'hidden' }
        return
    else
      switch Action
        when 'hide'
          Target.removeClass 'active'
          Page.css { overflow: 'auto' }
        when 'show'
          Target.addClass 'active'
          Page.css { overflow: 'hidden' }
    return

  # scroll-on-click
  ScrollToTargetHref = ($event) ->
    TargetId = $(this).attr('href')
    $event.stopPropagation()
    $event.preventDefault()
    Page.animate { scrollTop: $(TargetId).offset().top }
    return

  ###
    Main
  ###
  $(document).ready ->
    $('.scrollr').on 'click', ScrollToTargetHref
    $('.toggle-nav-overlay').on 'click', ToggleNavigationOverlay
    return
  return
