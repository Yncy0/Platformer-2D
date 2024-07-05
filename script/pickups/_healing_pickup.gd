extends Area2D


@export var healing_amount: int = 0


@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animation_player.play("pickup")
