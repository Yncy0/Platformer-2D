class_name MoveState extends PlayerState

func enter() -> void:
	player.animation_player.play("move")


func update_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		change_state.emit("JumpState")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	
	if player.velocity.x == 0:
		change_state.emit("IdleState")
	
	
	if Input.is_action_just_pressed("jump"):
		change_state.emit("JumpState")
	
	
	player.move_and_slide()

