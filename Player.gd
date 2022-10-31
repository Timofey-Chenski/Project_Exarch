extends KinematicBody2D

export (int) var speed = 200
export (int) var squadSize = 3
export var velocity = Vector2()
onready var animation = $RangerAnimation
var traveledDistance = 0

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



func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if velocity.x == 0 and velocity.y == 0: 
		animation.play("idle")
	else:
		traveledDistance += 1 * speed
		if traveledDistance >= 18000:
			spawnShooter()
			traveledDistance = 0

func spawnShooter():
	var shooter = load("res://Shooter.tscn").instance()
	shooter.position = position
	get_parent().add_child(shooter)
