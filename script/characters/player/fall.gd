class_name FallState extends PlayerState


func enter() -> void:
	if !player.is_riding:
		player.animated_sprite_2d.play("jump")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")
	
	player.buffer_jump_timer.start(0.5)


func update_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player.jump_available:
		change_state.emit("JumpState")
		#player.is_jump_buffer = false


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.is_on_floor():
		change_state.emit("IdleState")
	
	if player.is_hurt:
		change_state.emit("HitState") 
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()



func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		change_state.emit("BounceState")


func _on_buffer_jump_timer_timeout() -> void:
	player.jump_available = false
	print("timeout")
