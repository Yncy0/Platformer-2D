extends Node

var current_spawnpoint: Checkpoint
var player: Player


func player_spawnpoint() -> void:
	if current_spawnpoint != null:
		player.position = current_spawnpoint.global_position
		print("REE")

