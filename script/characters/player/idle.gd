class_name IdleState extends PlayerState

func enter() -> void:
	player.idling()
	player.animation_player.play("idle")


func _unhandled_input(_event: InputEvent) -> void:
	pass


func _physics_process(delta: float) -> void:
	player.direction = Input.get_axis("move_left", "move_right")
	
	if player.direction:
		change_state.emit("MoveState")

