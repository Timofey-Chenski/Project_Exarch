extends Node2D

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
	var bullet = load("res://Bullet.tscn").instance()
	var bulletVector = Vector2()
	var target = closestEnemy()
	bulletVector = position 
	bullet.position = position
	bullet.rotate(bulletVector.angle_to(target))
	get_parent().add_child(bullet)
	
	
func _ready():
	$AnimationPlayer.play("Shoot")
