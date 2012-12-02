# Code for SimpleForm::FormBuilder according to Bootrstrap
# https://gist.github.com/2705324
window.ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] =
  add: (element, settings, message) ->
    errorElement = undefined
    wrapper = undefined
    settings.wrapper_tag = '.control-group'
    settings.error_tag = 'span'
    settings.error_class = 'help-inline'
    settings.wrapper_error_class = 'error'
    settings.wrapper_success = 'success'
    if element.data('valid') isnt false
      wrapper = element.closest(settings.wrapper_tag)
      wrapper.removeClass(settings.wrapper_success)
      wrapper.addClass(settings.wrapper_error_class)
      errorElement = $("<#{settings.error_tag}/>",
        class: settings.error_class
        text: message
      )
      wrapper.find('.controls').append(errorElement)
    else
      wrapper = element.closest(settings.wrapper_tag)
      wrapper.addClass(settings.wrapper_error_class)
      element.parent().find("#{settings.error_tag}.#{settings.error_class}").text(message)

  remove: (element, settings) ->
    errorElement = undefined
    wrapper = undefined
    settings.wrapper_tag = '.control-group'
    settings.error_tag = 'span'
    settings.error_class = 'help-inline'
    settings.wrapper_error_class = 'error'
    settings.wrapper_success = 'success'
    wrapper = element.closest("#{settings.wrapper_tag}.#{settings.wrapper_error_class}")
    wrapper.removeClass(settings.wrapper_error_class)
    wrapper.addClass(settings.wrapper_success)
    errorElement = wrapper.find("#{settings.error_tag}.#{settings.error_class}")
    errorElement.remove()

$(document).ready ->
  $('div.control-group').focusout ->
    $(this).addClass('success') unless $('div.control-group').hasClass('error')
