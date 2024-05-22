extends Node2D

var player_coins = null
var level1 = preload("res://Levels/level_1.tscn")
var inst_level = level1.instantiate()

func _ready():
	
	player_coins = 0
	
	add_child(inst_level)
	move_child($player, 1) #Make Player stay on top layer
	
	var t = get_child(0)
	t = t.get_child(0)
	$player.position = t.position

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	#print($player.position) --> DEBUG

	if $player.position.y >= 90:
		print("YOU DIE")
