extends Node2D

var Floor = preload("res://Floor.tscn")
var Spike = preload("res://Spike.tscn")

func _ready():
	pass

func floor_spawn():
	print("DEBUG_SPAWN")
	var floor_instance = Floor.instance()
	floor_instance.position = Vector2(rand_range(0, 400), 600)
	get_parent().call_deferred("add_child", floor_instance)

func spike_spawn():
	print("DEBUG_SPIKE_SPAWN")
	var spike_instance = Spike.instance()
	spike_instance.position = Vector2(rand_range(0, 400), 600)
	get_parent().call_deferred("add_child", spike_instance)
	
func _on_SpawnTimer_timeout():
	var i = rand_range(1, 8)
	if (i < 5):
		floor_spawn()
	else:
		spike_spawn()

func _on_KillBox_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
