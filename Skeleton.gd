extends KinematicBody2D

onready var Player = get_parent().get_node('%Player')
var motion

func _ready(): 
	if is_instance_valid(Player):
		position  = Player.position + Vector2(rand_range(600,900), 0).rotated(rand_range(0, 2*PI))
		
func _physics_process(delta): 
	if is_instance_valid(Player):
		motion = move_and_slide((Player.position - position).normalized() * Player.speed * 0.5)
		if motion.x >0:
			$SkeletonAnimation.flip_h = false
		else:
			$SkeletonAnimation.flip_h = true
