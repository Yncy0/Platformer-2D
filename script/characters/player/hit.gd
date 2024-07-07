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


func exit() -> void:
	player.is_hurt = false
