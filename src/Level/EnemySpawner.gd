extends Node

var enemyNo = 1
var _timer = null
var rand  = RandomNumberGenerator.new()

func test() -> void:
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	rand.randomize()
	_timer.set_wait_time(rand.randf_range(3.0,5.0)) # timer
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _on_Timer_timeout():
	var enemyscene = load("res://source/Actors/Enemy.tscn")
	var screen_size = get_viewport().size
	
	for i in range(0, enemyNo):
		var enemy = enemyscene.instance()
		var position = get_node("Player").global_transform.origin
		rand.randomize()
		var x = rand.randf_range(position.x+600.0, position.x+1600.0) # x-range
		enemy.position.x = x
		enemy.position.y =-1.0
		add_child(enemy)
