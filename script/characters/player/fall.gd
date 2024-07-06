class_name FallState extends PlayerState


func enter() -> void:
	player.animation_player.play("jump")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.is_on_floor():
		change_state.emit("IdleState")
	
	
	player.move_and_slide()
