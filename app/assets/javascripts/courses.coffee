# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#42").change -> 
		sel = $("#42").val()
		if sel == "Sommersemester"
			$('.Wintersemester').hide()
			$('.Sommersemester').css("display", "block")
			$('.Nicht').hide()
		else if sel == "Wintersemester"
			$('.Sommersemester').hide()
			$('.Wintersemester').css("display", "block")
			$('.Nicht').hide()
		else if sel == "Unregelmäßig"
			$('.Sommersemester').hide()
			$('.Wintersemester').hide()
			$('.Nicht').css("display", "block")
		else
			$('.Sommersemester').css("display", "block")
			$('.Wintersemester').css("display", "block")
			$('.Nicht').css("display", "block")
		return
		