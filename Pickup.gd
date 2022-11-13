extends Area2D

func _ready():
	pass

func _on_Pickup_body_entered(body):
	randomize()
	var a = rand_range(1,4)
	if a <=2: body.speed += 10
	elif a <=3: body.pierceCount +=1
	elif a <=4: 
		if body.attackTriggerDistance >6000:
			body.attackTriggerDistance -=500
		else:pass
	queue_free()
