extends Control


@export var control: Control




func _on_back_button_pressed() -> void:
	if control != null:
		control.visible = true
		self.visible = false
	else:
		self.visible = false
