extends Node2D

var player_coins = null


func _ready():
	player_coins = 0

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	#print($player.position) --> DEBUG

	if $player.position.y >= 90:
		print("YOU DIE")
