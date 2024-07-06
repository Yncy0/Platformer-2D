class_name JumpState extends PlayerState


func enter() -> void:
	player.jumping()
	player.animation_player.play("jump")


func update_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		if player.velocity.y < 0:
			player.velocity.y = player.JUMP_VELOCITY/4.0


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	
	if Input.is_action_just_released("jump"):
		pass
	
	
	if player.velocity.y > player.JUMP_VELOCITY and !player.is_on_floor():
		change_state.emit("FallState")
	
	
	player.move_and_slide()

