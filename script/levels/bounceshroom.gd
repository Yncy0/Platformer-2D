extends StaticBody2D

@export var bounce_velocity: float = -100.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_bounce_area_body_entered(body: Node2D) -> void:
	if body is Player:
		animated_sprite_2d.play("default")
		body.bounce_velocity = self.bounce_velocity
		body.bounce_available = true
