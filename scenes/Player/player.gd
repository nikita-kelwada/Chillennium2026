extends CharacterBody2D

@export var speed: float = 400.0

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		print("INPUT DETECTED")
