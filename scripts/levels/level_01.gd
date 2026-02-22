extends Node2D

@onready var player_spawn: Marker2D = $PlayerSpawn

func _ready():
	var player = preload("res://scenes/Player.tscn").instantiate()
	add_child(player)
	player.global_position = player_spawn.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
