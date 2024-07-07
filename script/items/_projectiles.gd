extends Node2D


@export var projectile_speed: float = 100.0
@onready var sfx: AudioStreamPlayer = $SFX


func _ready() -> void:
	set_as_top_level(true)
	sfx.play()


func _physics_process(delta: float) -> void:
	position += transform.x * projectile_speed * delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body:
		queue_free()
