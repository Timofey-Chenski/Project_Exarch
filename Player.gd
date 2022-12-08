extends KinematicBody2D

#Upradeable stats block
export (int) var speed = 200
export (int) var attackTriggerDistance = 18000
export (int) var pierceCount = 1
export (int) var damage = 10
export (int) var maxHealth = 100
export (int) var healthRegen = 0 #0
export (int) var armor = 0 #0

#Internal components
var health = maxHealth
export var velocity = Vector2()
onready var animation = $RangerAnimation
export var traveledDistance = 0

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		animation.flip_h = false
		animation.play("run")
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		animation.flip_h = true
		animation.play("run")
	if Input.is_action_pressed("down"):
		velocity.y += 1
		animation.play("run")
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		animation.play("run")
	velocity = velocity.normalized() * speed

# warning-ignore:unused_argument
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity) #func uses delta
	if velocity.x == 0 and velocity.y == 0: 
		animation.play("idle")
	else:
		traveledDistance += 1 * speed
		if traveledDistance >= attackTriggerDistance:
			spawnShooter()
			traveledDistance = 0

func spawnShooter():
	var shooter = load("res://Shooter.tscn").instance()
	shooter.position = position
	shooter.pierceCount = pierceCount
	shooter.damage = damage
	
	get_parent().add_child(shooter)

func hit(hitValue):
	health -= hitValue - armor
	if health <=0:
		get_tree().reload_current_scene()

func trueHit(hitValue):
	health -= hitValue
	if health <=0:
		get_tree().reload_current_scene()

func _on_RegenTimer_timeout():
	if health < maxHealth:
		health += healthRegen
	elif health > maxHealth: health = maxHealth

func _on_Hurt_area_entered(area):
	if $InvulTimer.time_left == 0:
		hit(area.get_parent().damage)
		$InvulTimer.start()
