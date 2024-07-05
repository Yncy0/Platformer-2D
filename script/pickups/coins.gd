extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("idle")





func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animation_player.play("pickup")
