extends Node2D

#Preload all needed levels 
var level1 = "res://Levels/level_1.tscn"
var level2 = "res://Levels/level_2.tscn"
var level3 = "res://Levels/level_3.tscn"

var player_bank #WIP - Cash that the player collects before stashing it in the "lobby"

func get_level(): #Get currently loaded level
	var level_node = get_child(0)
	return level_node

func load_level(level): #Load level and position player
	remove_child(get_level()) #Remove previous level
	level = load(level)
	var inst_level = level.instantiate() 
	add_child(inst_level)
	
	move_child($Player, 1) #Make Player stay on top layer
	var start_positioner = get_child(0).get_child(0) #Get start positioner from level node
	$Player.position = start_positioner.position 
	
func _ready(): #Executes on game start
	player_bank = 0
	load_level(level2)

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	
#Demo Level Changer	
	if Input.is_action_just_pressed("sys_level1"):
		load_level(level1)
	if Input.is_action_just_pressed("sys_level2"):
		load_level(level2)
	if Input.is_action_just_pressed("sys_level3"):
		load_level(level3)

#Detect if player is falling down -- WIP
	if $Player.position.y >= 90:
		print("YOU DIE")
