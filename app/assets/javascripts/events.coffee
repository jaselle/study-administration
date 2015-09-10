#Javascript/coffeescript-Functions to set the rating if the page is loading 
#and to update the rating. 
#update_stars gets the parameters from the database and sets it to the view
#if a user performs a click on one of the stars, the rating is set and 
#is send to the database and the average-value gets updated. 
#
#


update_stars = ->
  $('.star_rating_form').each ->
    form_id = $(this).attr('id')
    set_stars form_id, $('#' + form_id + '_stars').val()
    return
  return

set_stars = (form_id, stars) ->
  i = 1
  while i <= 5
    if i <= stars
      $('#' + form_id + '_' + i).addClass 'on'
    else
      $('#' + form_id + '_' + i).removeClass 'on'
    i++
  return

$ ->
  $('.rating_star').click ->
    star = $(this)

    form_id = star.attr('data-form-id')
    stars = star.attr('data-stars')
    $('#' + form_id + '_stars').val stars
    $.ajax
      type: 'post'
      url: $('#' + form_id).attr('action') + '.json'
      data: $('#' + form_id).serialize()
      success: (response) ->
        console.log response
        
        update_stars()
        if response['avg_rating']
          $('#average_rating').text response['avg_rating']
        return
      error: (xhr, ajaxOptions, thrownError) ->
        alert thrownError
    return
  return