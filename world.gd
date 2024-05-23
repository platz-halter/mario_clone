extends Node2D

var player_coins = null

var level1 = preload("res://Levels/level_1.tscn")
var level2 = preload("res://Levels/level_2.tscn")

var main_char = preload("res://player.tscn")

func load_level(level):
	var inst_level = level.instantiate()
	add_child(inst_level)

func _ready():
	player_coins = 0
	
	move_child($Player, 1) #Make Player stay on top layer
	
	var t = get_child(0)
	t = t.get_child(0)
	$Player.position = t.position

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	#print($player.position) --> DEBUG

	if $Player.position.y >= 90:
		print("YOU DIE")
