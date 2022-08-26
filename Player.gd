extends KinematicBody2D

const UP = Vector2(0, -1)
const MAXFALLSPEED = 400
const JUMP = 400
const LEFT = -180
const RIGHT = 180

var score = 0
var iniGravity = 20
var motion = Vector2()
var Floor = preload("res://Floor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	gravity()
		
	if Input.is_action_just_pressed("JUMP"):
		motion.y = -JUMP
	
	if Input.is_action_just_pressed("LEFT"):
		motion.x = LEFT
		
	if Input.is_action_just_pressed("RIGHT"):
		motion.x = RIGHT
	motion = move_and_slide(motion, UP)
	
func gravity():
	motion.y += iniGravity
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
func floor_spawn():
	var floor_instance = Floor.instance()
	floor_instance.position = Vector2(rand_range(0, 400), 600)
	get_parent().call_deferred("add_child", floor_instance)

func _on_Detect_body_entered(body):
	if body.name == "Spike":
		get_tree().reload_current_scene()
