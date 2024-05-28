extends Node2D

#Preload all needed levels 
var level1 = preload("res://Levels/level_1.tscn")
var level2 = preload("res://Levels/level_2.tscn")

var player_bank #Cash that the player collects before stashing it in the "lobby"

func get_level(): #Get currently loaded level
	var level_node = get_child(0)
	return level_node

func load_level(level): #Load level and position player
	remove_child(get_level())
	var inst_level = level.instantiate()
	add_child(inst_level)
	
	move_child($Player, 1) #Make Player stay on top layer
	var t = get_child(0)
	t = t.get_child(0)
	$Player.position = t.position
	
func _ready(): #Executes on game start
	player_bank = 0
	
	load_level(level1)
	print(get_tree_string_pretty())

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		load_level(level2)
		#get_tree().quit()
	#print($player.position) --> DEBUG

	if $Player.position.y >= 90:
		print("YOU DIE")
