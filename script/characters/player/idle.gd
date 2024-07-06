class_name IdleState extends PlayerState

func enter() -> void:
	player.idling()
	player.animation_player.play("idle")


#func _unhandled_input(event: InputEvent) -> void:
	#player.direction = Input.get_axis("move_left", "move_right")
	#if player.direction:
		#change_state.emit("MoveState")


func _physics_process(_delta: float) -> void:
	player.moving()
	
	
	if player.velocity.x != 0:
		change_state.emit("MoveState")
	
	
	if Input.is_action_just_pressed("jump"):
		change_state.emit("JumpState")
	
	player.move_and_slide()
