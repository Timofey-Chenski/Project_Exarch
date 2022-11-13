extends KinematicBody2D

#Переменные для улучшения характеристик
export (int) var speed = 200
export (int) var attackTriggerDistance = 18000
export (int) var pierceCount = 1
#Проверяемые переменные
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
	velocity = move_and_slide(velocity)
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
	get_parent().add_child(shooter)
