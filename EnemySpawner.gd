extends Timer

onready var Player = get_parent().get_node("Player")

func spawn():
	var enemy = load("res://Skeleton.tscn").instance()
	if is_instance_valid(Player):
		add_child(enemy)
		enemy.position = Player.position + Vector2(1000, 0).rotated(rand_range(0, 2*PI))
