# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	#Listener on the dropdown menu
	$("#42").change -> 
		$('.Jedes').css("display", "block")
		$('.Nicht').css("display", "block")
		filter = $("#42").val()
		semester = filter.split(' ')[0]
		year = parseInt(filter.split(' ')[1].substring(0,4))
		# hide all events with irregular cycle

		# hide all events that does not match the selected cycle
		if filter.indexOf('Sommersemester') != -1
			$('.Nicht').hide()
			$('.Jedes.Wintersemester').hide()
			if year % 2 == 1
				$('.gerade').hide()
			else
				$('.ungerade').hide()
		if filter.indexOf('Wintersemester') != -1
			$('.Nicht').hide()
			$('.Jedes.Sommersemester').hide()
			if year % 2 == 1
				$('.gerade').hide()
			else
				$('.ungerade').hide()
		# show all events with irregular cycle which schedules match the selected cycle
		$('.'+semester+'.'+year).css("display", "block")
		return
		
	$('#selector').find('.button_to').click -> 
		tmp = $('#selector').find('.button_to').attr('action')
		$('#selector').find('.button_to').attr('action' , tmp + $("#24").val())
	return

	