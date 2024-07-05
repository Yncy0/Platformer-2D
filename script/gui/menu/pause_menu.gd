extends Control


@onready var settings_menu: Control = $SettingsMenu
@onready var pause_panel: Panel = $PausePanel


func _ready() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_panel.visible == false:
		pause_panel.visible = true
		get_tree().paused = true
	elif event.is_action_pressed("pause") and pause_panel.visible == true:
		pause_panel.visible = false
		get_tree().paused = false


func _process(_delta: float) -> void:
	pass
