extends Area2D


@export var projectile_speed: float = 100.0


func _ready() -> void:
	set_as_top_level(true)


func _physics_process(delta: float) -> void:
	position.x += projectile_speed * delta
