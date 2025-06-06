class_name IdleState extends PlayerState

func enter() -> void:
	player.jump_available = true
	player.idling()
	if !player.is_riding:
		player.animated_sprite_2d.play("idle")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")


func update_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player.jump_available:
		change_state.emit("JumpState")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.velocity.x != 0:
		change_state.emit("MoveState")
	
	if !player.is_on_floor():
		change_state.emit("FallState")

	if player.is_hurt:
		change_state.emit("HitState")
	
	if player.bounce_available:
		change_state.emit("BounceState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()
