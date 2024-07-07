class_name MoveState extends PlayerState

func enter() -> void:
	if !player.is_riding:
		player.animated_sprite_2d.play("move")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")


func update_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		change_state.emit("JumpState")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.velocity.x == 0:
		change_state.emit("IdleState")
	
	if !player.is_on_floor():
		change_state.emit("FallState")
	
	if player.is_hurt:
		change_state.emit("HitState")
	
	player.move_and_slide()

