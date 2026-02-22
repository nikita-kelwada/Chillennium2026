extends CharacterBody2D

@export var max_health: int = 100
@export var strength: int = 30
@export var defense: int = 20

var current_health: int

func _ready():
	current_health = max_health

func take_damage(enemyStrength: int, critical: bool):
	current_health -= float(enemyStrength*10/defense)*(randf()/5+0.8)*(2 if critical else 1)
	print("enemy health is " + str(current_health))
	current_health = clamp(current_health, 0, max_health)

	if current_health <= 0:
		#do dying
		pass
