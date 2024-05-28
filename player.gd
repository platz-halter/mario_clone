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

func _ready():
	health = max_health
func _physics_process(delta):
	local_speed = max_speed
	$HealthLabel.text = "Health:%s" % health
	
	if health <= 0:
		print("Game over!")
		get_tree().quit()
	
	velocity.y += local_grav
	
	if Input.is_action_pressed("dash"):
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
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jump_power
	move_and_slide()

func _on_collision_detector_area_entered(area):
	if area.is_in_group("spikes"):
		print("Seet liberty my leg")
		health = health - 1
