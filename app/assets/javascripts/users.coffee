# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').on 'click', 'tr.sorts th a', (e) ->
    e.preventDefault()
    $.ajax
  	  type: 'GET',
  	  url: @href,
  	  dataType: 'Script'

  $('body').on 'click', '.pagination a', (e) ->
    alert "hi"
    e.preventDefault()
    $.ajax
  	  type: 'GET',
  	  url: @href,
  	  dataType: 'Script'
     
  $('#search input').keyup ->
    $.get $('#users_search').attr('action'), $('#users_search').serialize(), null, 'script'
    