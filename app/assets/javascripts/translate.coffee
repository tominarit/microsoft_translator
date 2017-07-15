# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

translate = ->
  $('#get_translate').on 'click', ->
    reqURL = '/get_translate' +
      '?str=' + encodeURIComponent($("#str").val())
    $(this).attr('href', reqURL)

    $(document).ajaxSend ->
      $(".loading").show()
      $(".loading-overlay").css("opacity", "0.3").show()
      return
    $(document).ajaxSuccess (eo, XMLHttpRequest, set) ->
      data = XMLHttpRequest.responseJSON
      console.log data
      $("#result").val(data.eng)
      return
    $(document).ajaxError (eo, jqXHR, set) ->
      console.log jqXHR
      alert jqXHR.responseText
      return
    $(document).ajaxComplete ->
      $(".loading-overlay").fadeOut 100
      $(".loading").fadeOut 100
      return
$(document).on('turbolinks:load', translate)