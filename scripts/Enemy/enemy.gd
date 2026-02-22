extends CharacterBody2D

@export var max_health: int = 100
var current_health: int

func _ready():
	current_health = max_health

func take_damage(amount: int):
	current_health -= amount
	current_health = clamp(current_health, 0, max_health)

	if current_health <= 0:
		#do dying
		pass
