extends Area2D


@export var next_scene: String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneManager.next_scene = self.next_scene
		get_tree().call_deferred("change_scene_to_packed", SceneManager.loading_scene)
