counter = 0

checkKey = (e) ->
	e = e or window.event
	if e.keyCode >= 65 and e.keyCode <= 90
		#t
		if e.keyCode == 84
			if counter == 0 or counter == 2
				counter += 1
		#e
		else if e.keyCode == 69
			if counter == 1
				counter += 1
		#r
		else if e.keyCode == 82
			if counter == 3
				counter += 1
		#i
		else if e.keyCode == 73
			if counter == 4
				counter += 1
		#s
		else if e.keyCode == 83
			if counter == 5
				$(".overlay").show("slow")
		else 
			counter = 0
		return
	return

$ ->
	document.onkeydown = checkKey



