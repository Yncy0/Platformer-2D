class_name FallState extends PlayerState


func enter() -> void:
	player.animation_player.play("jump")


func _physics_process(delta: float) -> void:
	player.update_gravity(delta)
	if player.is_on_floor():
		change_state.emit("IdleState")
	
