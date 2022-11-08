extends Node2D

export var maxRange = 36000.0
export var speed = 400.0
onready var animator = $BulletAnimation

var _travelled_distance = 0

func _physics_process(delta: float) -> void:
	animator.play("Projectile")
	var distance = speed * delta
	var motion = transform.x * speed * delta
	position += motion
	_travelled_distance += distance
	if _travelled_distance >= maxRange: queue_free()


func _on_Area2D_area_entered(area):
	area.get_parent().get_node("AnimationPlayer").play("Death")
	queue_free()
