$(document).ready ->
  $(".btop-third-link").height $("#btop-container").height() - 5

  $(".menu_item").bind 'mouseenter', (event) ->
	  if !$(this).hasClass 'current'
		  $links = $(this).find '.nested_links'
		  $links.removeClass 'hidden'

  $(".menu_item").bind 'mouseleave', (event) ->
    $links = $(this).find('.nested_links')
    $links.addClass('hidden')

  $("#show_new_review_form").bind "click", (event) ->
    event.preventDefault()
    unless $("#new_review_form_wrapper").is(":visible")
      $("#new_review_form_wrapper").slideDown 300
      $(".review_buffer").slideUp 200
    else
      $("#new_review_form_wrapper").slideUp 300
      $(".review_buffer").slideDown 200

  $("#new_review_form_wrapper").hide() unless $("#new_review_form_wrapper .field_with_errors").length > 0

  $(".dropdown-toggle").bind 'mouseenter', (event) ->
    $(".dropdown-menu").css "display", "block"
  $(".dropdown-toggle").bind 'mouseleave', (event) ->
    $(".dropdown-menu").css "display", "none" unless $(".dropdown-menu").is ":hover"
  $(".dropdown-menu").bind 'mouseleave', (event) ->
    $(this).css "display", "none"