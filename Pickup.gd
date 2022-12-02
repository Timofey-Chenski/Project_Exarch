extends Area2D

func _ready():
	pass

func _on_Pickup_body_entered(body):
	randomize()
	var a = randi() % 100 + 1
	if a <=30: pass
	#elif a <= 50: body.healt += 20
	elif a <= 60: body.speed += 20
	elif a <= 70: 
		if body.attackTriggerDistance >=6000:
			body.attackTriggerDistance -=1000
		else: body.speed += 20
	elif a<=80: body.damage += 5
	#elif a<=90: body.healthRegen += 2
	elif a<=95: body.pierceCount +=1
	#elif a<=100: body.armor += 5
	queue_free()
