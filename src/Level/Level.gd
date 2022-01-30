extends Node2D

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

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
