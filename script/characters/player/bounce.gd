class_name BounceState extends PlayerState

func enter() -> void:
	player.bouncing()
	player.animated_sprite_2d.play("jump")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.velocity.y > -3.0 and !player.is_on_floor():
		change_state.emit("FallState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()
