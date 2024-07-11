class_name HitState extends PlayerState


@onready var sfx_hurt: AudioStreamPlayer = %SFXHurt


func enter() -> void:
	player.idling()
	player.animated_sprite_2d.play("hit")
	player.animation_player.play("hit")
	sfx_hurt.play()
	
	if player.is_riding:
		player.animation_player.play("unmount")
		player.is_riding = false
	
	await player.animated_sprite_2d.animation_finished
	change_state.emit("IdleState")


func update_physics_process(delta: float) -> void:
	player.update_gravity(delta)
	player.move_and_slide()
	player.platform_velocity = player.get_platform_velocity()

func exit() -> void:
	player.is_hurt = false
