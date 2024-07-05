extends Control


var starting_scene = load("res://scene/levels/level_01.tscn")


func _on_start_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_packed", starting_scene)
