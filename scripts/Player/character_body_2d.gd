extends CharacterBody2D

@export var speed: float = 400.0
@export var battle_range: float = 200.0 

# This links the script to your new AnimatedSprite2D node
@onready var _animated_sprite = $AnimatedSprite2D
var enemy = null

func _ready():
	# Wait a split second to make sure the Enemy has joined the group
	await get_tree().create_timer(0.1).timeout
	enemy = get_tree().get_first_node_in_group("Enemy")

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	var target_velocity = dir.normalized() * speed
	
	# --- ANIMATION LOGIC ---
	if dir.length() > 0:
		# If moving up (y is negative), show the back
		if dir.y < 0:
			_animated_sprite.play("back")
		# If moving down (y is positive), show the front
		elif dir.y > 0:
			_animated_sprite.play("front")
		# If moving only left/right, it continues playing whatever 
		# vertical direction it was already facing.
	else:
		# When stopped, stay on Frame 0 (standing still)
		_animated_sprite.stop()
		_animated_sprite.frame = 0

	# --- BATTLE BOUNDARY LOGIC ---
	if enemy:
		var current_dist = global_position.distance_to(enemy.global_position)
		if current_dist <= battle_range:
			var projected_pos = global_position + (target_velocity * _delta)

	velocity = target_velocity
	move_and_slide()
