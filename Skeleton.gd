extends KinematicBody2D

onready var Player = get_parent().get_node("Player")

func _ready(): 
	if is_instance_valid(Player):
		position  = Player.position + Vector2(1000, 0).rotated(rand_range(0, 2*PI))
		
func _physics_process(delta): 
	if is_instance_valid(Player):
		move_and_slide((Player.position - position).normalized() * Player.speed * 0.5)
