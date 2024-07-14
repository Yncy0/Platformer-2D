class_name Projectiles extends Node2D


@export var projectile_speed: float = 100.0
@export var shoot_axis_x: bool = false
@export var shhot_axis_y: bool = false

@onready var sfx: AudioStreamPlayer = $SFX


func _ready() -> void:
	set_as_top_level(true)
	sfx.play()


func _physics_process(delta: float) -> void:
	if shoot_axis_x:
		position += transform.x * projectile_speed * delta
	elif shhot_axis_y:
		position += transform.y * projectile_speed * delta


func disable_visuals(animated_sprite: AnimatedSprite2D, area: Hitbox) -> void:
	animated_sprite.queue_free()
	area.queue_free()


func _on_timer_timeout() -> void:
	queue_free()


#func _on_hitbox_body_entered(body: Node2D) -> void:
	#if body:
		#queue_free()
