extends CharacterBody2D

@export var max_speed 		= 50
@export var jump_power 		= 50
@export var local_grav 		= 2
@export var jump_cooldown 	= 2
@export var max_health 		= 3
@export var dash_max 		= 100
@export var dash_cooldown 	= 10

var local_speed
var local_coins
var health

func _ready(): #Reset vars at creation
	health 		= max_health
	local_coins = 0
	velocity	= Vector2(0,0)
	
func _physics_process(delta):
	#Misc
	local_speed = max_speed
	
	#Health system
	$HealthLabel.text = "Health:%s" % health #Health label
	if health <= 0:
		print("Game over!")
		get_tree().quit() #Exit game
	
	#Gravity
	velocity.y += local_grav
	
	#Movement controller
	if Input.is_action_pressed("dash"): #WIP
		local_speed += dash_max	
	else:
		local_speed = max_speed
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = local_speed
		$player_sprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -local_speed
		$player_sprite.flip_h = false
	else:
		velocity.x = 0
	
	#Prevent unlimited jumping
	if is_on_floor(): #Check if player touches floor
		if Input.is_action_just_pressed("ui_up"): #Jumping
			velocity.y = -jump_power
	
	#Execute positional change
	move_and_slide()

#Global collision detector
func _on_collision_detector_area_entered(area):
	if area.is_in_group("spikes"): #Detect if object is in spikes group
		health -= 1
	if area.is_in_group("coins"): # WIP
		local_coins += local_coins 
		area.remove_from_group("coins") # --> Coin destroys itself
		
