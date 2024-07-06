extends AnimatedSprite2D


func _unhandled_input(event: InputEvent) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		play("move")
	else:
		play("idle")
		
	if event.is_action_pressed("move_left"):
		flip_h = true
	
	if event.is_action_pressed("move_right"):
		flip_h = false
	
	if event.is_action_pressed("jump"):
		play("jump")
