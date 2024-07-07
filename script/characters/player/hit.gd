class_name HitState extends PlayerState


func enter() -> void:
	player.animated_sprite_2d.play("hit")
	player.sfx_hurt.play()


func exit() -> void:
	await player.animated_sprite_2d.animation_finished
	change_state.emit("IdleState")
