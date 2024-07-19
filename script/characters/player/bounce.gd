class_name BounceState extends PlayerState

func enter() -> void:
	player.bouncing()
	player.animated_sprite_2d.play("jump")


func exit() -> void:
	player.bounce_velocity = -250.0


func update_input(event: InputEvent) -> void:
	if event.is_action_released("move_left") or event.is_action_released("move_right"):
		player.velocity.x = player.platform_velocity.x/10.0


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.velocity.y > 0:
		change_state.emit("FallState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()
