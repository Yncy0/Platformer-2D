class_name JumpState extends PlayerState


@onready var sfx_jump: AudioStreamPlayer = %SFXJump


func enter() -> void:
	player.jumping()
	sfx_jump.play()
	
	
	if !player.is_riding:
		player.animated_sprite_2d.play("jump")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")


func update_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		if player.velocity.y < 0:
			player.velocity.y = player.JUMP_VELOCITY/3.0
	
	if event.is_action_released("move_left") or event.is_action_released("move_right"):
		player.velocity.x = player.platform_velocity.x/10.0


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	#print(player.velocity.y)
	
	if player.velocity.y > 0:
		change_state.emit("FallState")
	
	if player.is_hurt:
		change_state.emit("HitState")
	
	if player.bounce_available:
		change_state.emit("BounceState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()

