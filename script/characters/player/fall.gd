class_name FallState extends PlayerState


@onready var jump_buffer_timer: Timer = %JumpBufferTimer
@onready var coyoter_timer: Timer = %CoyoterTimer

var jump_buffer_available: bool = true


func enter() -> void:
	if !player.is_riding:
		player.animated_sprite_2d.play("jump")
	else:
		player.animation_player.play("mount")
		player.animated_sprite_2d.play("mount")
	
	jump_buffer_timer.start(0.5)
	coyoter_timer.start(0.1)


func update_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		if jump_buffer_available:
			change_state.emit("JumpState")
		if player.jump_available:
			change_state.emit("JumpState")
			#player.jump_available = false
	
	if event.is_action_released("move_left") or event.is_action_released("move_right"):
		player.velocity.x = player.platform_velocity.x/10.0


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.moving()
	
	if player.is_on_floor():
		change_state.emit("IdleState")
	
	if player.is_hurt:
		change_state.emit("HitState") 
	
	if player.bounce_available:
		change_state.emit("BounceState")
	
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()


func _on_jump_buffer_timer_timeout() -> void:
	jump_buffer_available = false


func _on_coyoter_timer_timeout() -> void:
	player.jump_available = false
