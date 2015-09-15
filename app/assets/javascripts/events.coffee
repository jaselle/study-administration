#Javascript/coffeescript-Functions to set the rating if the page is loading 
#and to update the rating. 
#update_stars gets the parameters from the database and sets it to the view
#if a user performs a click on one of the stars, the rating is set and 
#is send to the database and the average-value gets updated. 
#
#


  $("#event_cycle").change -> 
    if $("#event_cycle").val() == "Nicht regelmäßig"
      $("#nextDate").show()
    else 
      $("#nextDate").hide()
    return   
    if $("#event_cycle").val() == "Nicht regelmäßig"
      $("#nextDate").show()
    else 
      $("#nextDate").hide()
    return

  $('body').on 'click', 'tr.sorts th a', (e) ->
    e.preventDefault()
    $.ajax
      type: 'GET',
      url: @href,
      dataType: 'Script'

  $('body').on 'click', '.pagination a', (e) ->
    e.preventDefault()
    $.ajax
      type: 'GET',
      url: @href,
      dataType: 'Script'
     
  $('#search input').keyup ->
    $.get $('#events_search').attr('action'), $('#events_search').serialize(), null, 'script'
    
  $('.our_list_item').each (index) ->
    $('#myDiv' + index).click ->
      if $('#' + index).prop('checked')
        $('#' + index).prop 'checked', false
      else
        $('#' + index).prop 'checked', true
      return
    return

  $('#myCourse').click ->
    if $('#check_course').prop('checked')
      $('#check_course').prop 'checked', false
    else
      $('#check_course').prop 'checked', true
    return

