extends Node2D

var bullet = preload("res://Bullet.tscn").instance()
export var pierceCount = 1

func closestEnemy():
	var closestEnemy = Vector2()
	var distanceToClosestEnemy = INF
	var enemy = get_parent().get_node('Spawner')
	var enemyList = enemy.get_children()
	
	for currentEnemy in range(1,enemyList.size()):
		var distanceToEnemy = (enemyList[currentEnemy].position - position).length_squared()
		if distanceToEnemy < distanceToClosestEnemy:
			distanceToClosestEnemy = distanceToEnemy
			closestEnemy = enemyList[currentEnemy].position
	return closestEnemy

func shoot() -> void:
	bullet.position = position
	bullet.pierceCount = pierceCount
	bullet.look_at(closestEnemy())
	get_parent().add_child(bullet)

func _ready():
	if closestEnemy().x - position.x <=0: $AnimatedSprite.flip_h = true
	else: $AnimatedSprite.flip_h = false
	$AnimationPlayer.play("Shoot")
