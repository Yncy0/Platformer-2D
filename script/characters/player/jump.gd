class_name JumpState extends PlayerState


func enter() -> void:
	player.jumping()
	player.animation_player.play("jump")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		if player.velocity.y < 0:
			player.velocity.y = player.JUMP_VELOCITY/4.0


func _physics_process(_delta: float) -> void:
	if player.velocity.y > player.JUMP_VELOCITY and !player.is_on_floor():
		change_state.emit("FallState")
	

