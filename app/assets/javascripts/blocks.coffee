# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	i = 1
	x = parseInt($(".blockCount").attr('value'));
	while i <= x
		$("#"+i).progressbar
			value: parseInt($("#"+i).attr('value'));
			max: parseInt($("#"+i).attr('max'));
		i++
