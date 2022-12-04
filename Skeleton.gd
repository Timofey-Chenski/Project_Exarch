extends KinematicBody2D

export (int) var health = 20
export (int) var damage = 20
export (int) var healthRegen = 0
export (int) var armor = 0

onready var Player = get_parent().get_node('%Player')
var motion

func _ready(): 
	randomize() #Рандомизация клюбча для генератора случаных чисел
	if is_instance_valid(Player):
		position  = Player.position + Vector2(rand_range(600,900), 0).rotated(rand_range(0, 2*PI))
		
func _physics_process(delta): 
	if is_instance_valid(Player):
		motion = move_and_slide((Player.position - position).normalized() * Player.speed * 0.5)
		if motion.x >0:
			$SkeletonAnimation.flip_h = false
		else:
			$SkeletonAnimation.flip_h = true

func dropUpgrade():
	var chance = randi() % 100 + 1 # 1 to 100
	if chance <= 10:
		var pickUp = load("res://Pickup.tscn").instance()
		pickUp.position = position
		get_parent().add_child(pickUp)
	else: pass

func hit(hitValue):
	health -= hitValue - armor
	if health <=0: $AnimationPlayer.play("Death")
