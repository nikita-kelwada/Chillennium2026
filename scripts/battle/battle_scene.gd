extends Node2D

var user_turn := true

@onready var enemy = $Enemy
@onready var player_body: CharacterBody2D = $Player/CharacterBody2D
@onready var player_sprite: AnimatedSprite2D = $Player/CharacterBody2D/AnimatedSprite2D

func _ready() -> void:
	# Stop overworld script from changing animations
	player_body.in_battle = true

	# Force the battle animation + force loop
	player_sprite.sprite_frames.set_animation_loop("battle", true)
	player_sprite.play("battle")

func _on_attack_button_pressed() -> void:
	print(enemy.current_health)
	enemy.take_damage(10)

	# AI attack
	player_body.take_damage(10)

	user_turn = false
