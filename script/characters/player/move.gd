class_name MoveState extends PlayerState

func enter() -> void:
	player.animation_player.play("move")


func _physics_process(_delta: float) -> void:
	player.moving()
	
	
	if player.velocity.x == 0:
		change_state.emit("IdleState")
	
	
	if Input.is_action_just_pressed("jump"):
		change_state.emit("JumpState")
	
	
	player.move_and_slide()

