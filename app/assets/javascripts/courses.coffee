# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#42").change -> 
		sel = $("#42").val()
		if sel == "Sommersemester"
			$('.Sommersemester').show()
			$('.Wintersemester').hide()
			$('.Nicht').hide()
		else if sel == "Wintersemester"
			$('.Sommersemester').hide()
			$('.Wintersemester').show()
			$('.Nicht').hide()
		else if sel == "Unregelmäßig"
			$('.Sommersemester').hide()
			$('.Wintersemester').hide()
			$('.Nicht').show()
		else
			$('.Sommersemester').show()
			$('.Wintersemester').show()
			$('.Nicht').show()
		return
		