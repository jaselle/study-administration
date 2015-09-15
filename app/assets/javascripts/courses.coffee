# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#42").change -> 
		sel = $("#42").val()
		$('.Sommersemester').css("display", "block")
		$('.Wintersemester').css("display", "block")
		$('.Nicht').css("display", "block")
		$('.Jedes').css("display", "block")
		if sel == "Sommersemester"
			$('.Wintersemester').hide()
			$('.Nicht').hide()
		else if sel == "Wintersemester"
			$('.Sommersemester').hide()
			$('.Nicht').hide()
		else if sel == "Unregelmäßig"
			$('.Sommersemester').hide()
			$('.Wintersemester').hide()
			$('.Jedes').hide()
		return
		
	$('#selector').find('.button_to').click -> 
		tmp = $('#selector').find('.button_to').attr('action')
		$('#selector').find('.button_to').attr('action' , tmp + $("#24").val())
	return

	