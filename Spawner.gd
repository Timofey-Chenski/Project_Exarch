extends Node2D

var squadSize  = 3
var maxHealth = 20
var damage = 20
var healthRegen = 0
var armor = 0
var speed = 100

func spawn(): 
	var enemy = load("res://Skeleton.tscn").instance()
	enemy.maxHealth = maxHealth
	enemy.damage = damage
	enemy.healthRegen = healthRegen
	enemy.armor = armor
	enemy.speed = speed
	add_child(enemy)

func _on_Timer_timeout():
# warning-ignore:unused_variable
	for i in range(squadSize+1):
		spawn()

func _on_UpgradeTimer_timeout():
	squadSize +=3
	maxHealth +=20
	damage +=10
	healthRegen +=5
	armor +=5
	speed +=50
	
