extends Node2D

export (int) var squadSize  = 1

func spawn(): 
	var enemy = load("res://Skeleton.tscn").instance()
	add_child(enemy)

func _on_Timer_timeout():
	for i in range(squadSize+1):
		spawn()
