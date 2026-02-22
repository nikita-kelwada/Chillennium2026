extends CharacterBody2D

@export var speed: float = 400.0
@export var battle_range: float = 200.0 

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var enemy = null
var facing := "front"   # remembers last direction ("front" or "back")

func _ready():
	# start facing front, idle on frame 0
	_animated_sprite.play(facing)
	_animated_sprite.stop()
	_animated_sprite.frame = 0

	await get_tree().create_timer(0.1).timeout
	enemy = get_tree().get_first_node_in_group("Enemy")

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	var target_velocity = dir.normalized() * speed

	# --- ANIMATION LOGIC ---
	if dir.length() > 0:
		# Update facing ONLY when moving vertically
		if dir.y < 0:
			facing = "back"
		elif dir.y > 0:
			facing = "front"

		# Play the correct walking animation
		if _animated_sprite.animation != facing or !_animated_sprite.is_playing():
			_animated_sprite.play(facing)
	else:
		# Stop walking but KEEP last facing pose (don’t revert to front)
		_animated_sprite.stop()
		_animated_sprite.frame = 0   # idle pose for that facing animation

	# --- BATTLE BOUNDARY LOGIC ---
	if enemy:
		var current_dist = global_position.distance_to(enemy.global_position)
		if current_dist <= battle_range:
			var projected_pos = global_position + (target_velocity * delta)
			# (your boundary logic goes here)

	velocity = target_velocity
	move_and_slide()
