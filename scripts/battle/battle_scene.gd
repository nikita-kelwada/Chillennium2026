extends Node2D

var user_turn := true

@onready var enemy = $Enemy
<<<<<<< HEAD
@onready var player_body: CharacterBody2D = $Player/CharacterBody2D
@onready var player_sprite: AnimatedSprite2D = $Player/CharacterBody2D/AnimatedSprite2D
=======
@onready var player = $Player/CharacterBody2D
@onready var _animated_sprite = $Player/CharacterBody2D/AnimatedSprite2D
>>>>>>> 2902da163e5d6b72c430e58144a111dc3566b63d

func _ready() -> void:
<<<<<<< HEAD
	# Stop overworld script from changing animations
	player_body.in_battle = true
=======
	#_animated_sprite.play("battle")
	pass # Replace with function body.
>>>>>>> 2902da163e5d6b72c430e58144a111dc3566b63d

	# Force the battle animation + force loop
	player_sprite.sprite_frames.set_animation_loop("battle", true)
	player_sprite.play("battle")

func _on_attack_button_pressed() -> void:
	print(enemy.current_health)
<<<<<<< HEAD
	enemy.take_damage(10)

	# AI attack
	player_body.take_damage(10)
=======
	enemy.take_damage(player.strength, randf() > 0.9)
	
	#AI attack
	player.take_damage(enemy.strength, randf() > 0.9)
>>>>>>> 2902da163e5d6b72c430e58144a111dc3566b63d

	user_turn = false
