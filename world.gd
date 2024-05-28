extends Node2D

var level1 = preload("res://Levels/level_1.tscn")
var level2 = preload("res://Levels/level_2.tscn")

var player_bank

func load_level(level):
	var inst_level = level.instantiate()
	add_child(inst_level)
func get_level():
	var level_node = get_child(0)
	return level_node

func _ready():
	player_bank = 0
	
	move_child($Player, 1) #Make Player stay on top layer
	var t = get_child(0)
	t = t.get_child(0)
	$Player.position = t.position
	
	print(get_tree_string_pretty())
	
func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	#print($player.position) --> DEBUG

	if $Player.position.y >= 90:
		print("YOU DIE")
