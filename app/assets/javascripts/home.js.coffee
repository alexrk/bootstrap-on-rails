jQuery ($) ->
  # Go to top links
  $('#go-to-top').on 'click', (event) ->
    event.preventDefault()
    window.scrollTo(0, 0)
    false

  # Flash messages auto-hiding
  flash_messages = $('.flash-messages .alert')
  if flash_messages.length > 0
    setTimeout ->
      $('.flash-messages .alert').slideUp ->
        $(this).remove()
    , 5000
