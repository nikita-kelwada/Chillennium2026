extends CharacterBody2D

@export var speed: float = 400.0
@export var battle_range: float = 200.0 

var enemy = null

func _ready():
	# This looks for the node you just added to the "Enemy" group
	enemy = get_tree().get_first_node_in_group("Enemy")

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	var target_velocity = dir.normalized() * speed
	
	if enemy:
		var current_dist = global_position.distance_to(enemy.global_position)
		
		if current_dist <= battle_range:
			var projected_pos = global_position + (target_velocity * _delta)
			var projected_dist = projected_pos.distance_to(enemy.global_position)
			
			# Block movement if it makes the player get closer than battle_range
			if projected_dist < current_dist:
				target_velocity = Vector2.ZERO
	
	velocity = target_velocity
	move_and_slide()

	# --- SCREEN BOUNDARY LOGIC ---
	# Gets the size of your game window (e.g., 1152x648)
	var screen_size = get_viewport_rect().size
	
	# Clamp ensures the position never goes below 0 or above the screen width/height
	global_position.x = clamp(global_position.x, 0, screen_size.x)
	global_position.y = clamp(global_position.y, 0, screen_size.y)
