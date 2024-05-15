extends CharacterBody2D

@export var max_speed = 50
@export var jump_power = 50
@export var local_grav = 2

func _ready():
	print("Hello world")
func _physics_process(delta):
	velocity.y += local_grav
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = max_speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -max_speed
	else:
		velocity.x = 0	
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -jump_power
	
	
	move_and_slide()
	

