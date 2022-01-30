extends Node2D

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

var enemyNo = 1
var _timer = null
var rand  = RandomNumberGenerator.new()

func _ready():
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
#			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM


func _on_ZoneChange_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("hello")
	get_node("Player/Sprite").texture = load("res://assets/art/player/robot_demo_dark.png")
	get_node("Music").stream = load("res://assets/audio/music/music_dark.mp3")
	get_node("Music").play()
	get_node("ParallaxBackground2/Sprite").visible = true

func _on_ZoneChange_body_shape_entered_spawn_enemy(body_rid, body, body_shape_index, local_shape_index):
	# spawn enemy
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	rand.randomize()
	_timer.set_wait_time(rand.randf_range(2.0,4.0)) # timer
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _on_Timer_timeout():
	var enemyscene = load("res://src/Actors/Enemy.tscn")
	var screen_size = get_viewport().size
	rand.randomize()
	
	for i in range(0, rand.randf_range(1,enemyNo)):
		var enemy = enemyscene.instance()
		var position = get_node("Player").global_transform.origin
		rand.randomize()
		var x = rand.randf_range(position.x, position.x+500.0) # x-range
		enemy.position.x = x
		enemy.position.y =-1.0
		add_child(enemy)
