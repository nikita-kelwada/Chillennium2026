extends CharacterBody2D

const SPEED = 100.0
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		move_and_slide()
