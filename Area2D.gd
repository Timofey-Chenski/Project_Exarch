extends Node2D

export var maxRange = 2600.0
export var speed = 400.0
export var pierceCount = 1
export var damage = 0
onready var animator = $BulletAnimation
var pierced = 0

var _travelled_distance = 0

func _physics_process(delta: float) -> void:

	animator.play("Projectile")
	var distance = speed * delta
	var motion = transform.x * speed * delta
	position += motion
	_travelled_distance += distance
	if _travelled_distance >= maxRange: queue_free()
	if pierced >= pierceCount: queue_free()

func _on_Area2D_area_entered(area):
	area.get_parent().hit(damage)
	pierced +=1
