#Javascript/coffeescript-Functions to set the rating if the page is loading 
#and to update the rating. 
#update_stars gets the parameters from the database and sets it to the view
#if a user performs a click on one of the stars, the rating is set and 
#is send to the database and the average-value gets updated. 
#
#


#update_stars = ->
# $('.star_rating_form').each ->
#    form_id = $(this).attr('id')
#    set_stars form_id, $('#' + form_id + '_stars').val()
#    return
#  return

#set_stars = (form_id, stars) ->
#  i = 1
#  while i <= 5
#    if i <= stars
#      $('#' + form_id + '_' + i).addClass 'on'
#    else
#      $('#' + form_id + '_' + i).removeClass 'on'
#    i++
#  return


#  return