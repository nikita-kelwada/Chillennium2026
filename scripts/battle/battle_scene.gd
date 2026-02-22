extends Node2D

var user_turn = true;
@onready var enemy = $Enemy
@onready var player = $Player/CharacterBody2D
@onready var _animated_sprite = $Player/CharacterBody2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#_animated_sprite.play("battle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_attack_button_pressed():
	#if !user_turn:
		#return 

	print(enemy.current_health)
	enemy.take_damage(player.strength, randf() > 0.9)
	
	#AI attack
	player.take_damage(enemy.strength, randf() > 0.9)

	user_turn = false
