class_name HitState extends PlayerState


func enter() -> void:
	player.animated_sprite_2d.play("hit")
	player.animation_player.play("hit")
	player.sfx_hurt.play()
	
	if player.is_riding:
		player.animation_player.play("unmount")
		player.is_riding = false
	
	await player.animated_sprite_2d.animation_finished
	change_state.emit("IdleState")


func update_physics_process(_delta: float) -> void:
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()

func exit() -> void:
	player.is_hurt = false
