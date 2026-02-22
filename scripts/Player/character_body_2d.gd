extends CharacterBody2D

@export var speed: float = 400.0
@export var battle_range: float = 200.0

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var enemy = null
var facing := "front"
var in_battle := false

func _ready() -> void:
	# Start facing front, idle
	_animated_sprite.play(facing)
	_animated_sprite.stop()
	_animated_sprite.frame = 0

	await get_tree().create_timer(0.1).timeout
	enemy = get_tree().get_first_node_in_group("Enemy")

func _physics_process(delta: float) -> void:
	# If we're in battle, do NOT move and do NOT overwrite animations
	if in_battle:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var dir = Input.get_vector("left", "right", "up", "down")
	var target_velocity = dir.normalized() * speed

	# --- ANIMATION LOGIC (overworld only) ---
	if dir.length() > 0:
		if dir.y < 0:
			facing = "back"
		elif dir.y > 0:
			facing = "front"

		if _animated_sprite.animation != facing or !_animated_sprite.is_playing():
			_animated_sprite.play(facing)
	else:
		_animated_sprite.stop()
		_animated_sprite.frame = 0

	velocity = target_velocity
	move_and_slide()
