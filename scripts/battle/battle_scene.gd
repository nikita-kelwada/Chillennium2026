extends Node2D

var user_turn = true;
@onready var enemy = $Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_attack_button_pressed():
	#if !user_turn:
		#return 

	print(enemy.current_health)
	enemy.take_damage(10)
	user_turn = false
