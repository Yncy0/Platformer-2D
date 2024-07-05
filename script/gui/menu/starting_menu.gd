extends Control


@onready var settings_menu: Control = $SettingsMenu
@onready var control: Control = $Control


var starting_scene = load("res://scene/levels/level_01.tscn")


func _on_start_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_packed", starting_scene)


func _on_settings_button_pressed() -> void:
	settings_menu.visible = true
	control.visible = false
