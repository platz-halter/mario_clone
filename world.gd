extends Node2D

func _ready():
	pass

func _process(delta): #System UI
	if Input.is_action_just_pressed("sys_exit"):
		get_tree().quit()
	#print($player.position) --> DEBUG

	if $player.position.y >= 90:
		print("YOU DIE")
