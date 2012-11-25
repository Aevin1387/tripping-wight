# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#post_raw_content").keyup ->
    $.ajax
      url: '/posts/preview',
      dataType: 'json',
      type: 'POST'
      data:
        content:
          $('#post_raw_content').val()
      success: (js) ->
        # $("#post_preview").html(js)
        $("#post_preview").html(js)