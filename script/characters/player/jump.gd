class_name JumpState extends PlayerState


func enter() -> void:
	player.jumping()
	player.sfx_jump.play()
	
	if !player.is_riding:
		player.animated_sprite_2d.play("jump")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")


func update_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		if player.velocity.y < 0:
			player.velocity.y = player.JUMP_VELOCITY/4.0


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.velocity.y > -3.0 and !player.is_on_floor():
		change_state.emit("FallState")
	
	if player.is_hurt:
		change_state.emit("HitState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()

