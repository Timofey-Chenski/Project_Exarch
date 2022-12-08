extends Area2D

var upgradeTicket=0

func _ready():
	$AnimationPlayer.play("RESET")
	randomize()
	upgradeTicket= randi() % 100 + 1

func _on_Pickup_body_entered(body):
	if upgradeTicket<=30:
		pass
		$AnimationPlayer.play("Misfire")
	elif upgradeTicket<= 50:
		body.maxHealth += 20
		$AnimationPlayer.play("MaxHP")
	elif upgradeTicket<= 60:
		body.speed += 20
		$AnimationPlayer.play("Speed")
	elif upgradeTicket<= 70:
		if body.attackTriggerDistance >=6000:
			body.attackTriggerDistance -=1000
			$AnimationPlayer.play("Trigger")
		else: 
			body.speed += 20
			$AnimationPlayer.play("Speed")
	elif upgradeTicket<=80:
		body.damage += 5
		$AnimationPlayer.play("Damage")
	elif upgradeTicket<=90:
		body.healthRegen += 1
		$AnimationPlayer.play("Regen")
	elif upgradeTicket<=95:
		body.pierceCount +=1
		$AnimationPlayer.play("Pierce")
	elif upgradeTicket<=100:
		body.armor += 5
		$AnimationPlayer.play("Armor")
