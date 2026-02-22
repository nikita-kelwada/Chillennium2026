extends CharacterBody2D

@export var speed: float = 400.0

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		print("KEY:", event.keycode)
		
func _physics_process(_delta: float) -> void:
	print("title")
	var dir: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = dir.normalized() * speed
	move_and_slide()
