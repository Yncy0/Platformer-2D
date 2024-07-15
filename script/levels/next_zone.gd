extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().call_deferred("change_scene_to_packed", SceneManager.loading_scene)
