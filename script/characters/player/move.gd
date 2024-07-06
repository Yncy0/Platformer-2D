class_name MoveState extends PlayerState

func enter() -> void:
	player.animation_player.play("move")


func _physics_process(delta: float) -> void:
	player.moving()
	
	if player.velocity.x == 0:
		change_state.emit("IdleState")

