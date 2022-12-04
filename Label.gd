extends Label
var finTime = 601
var time = finTime

func _process(delta):
	time -= delta
	var seconds = fmod(time,60)
	var minutes = fmod(time,60*60) / 60
	
	var timePassed = "%02d : %02d" % [minutes,seconds]
	text = timePassed
	
	if time <= 0: 
		get_tree().reload_current_scene()
