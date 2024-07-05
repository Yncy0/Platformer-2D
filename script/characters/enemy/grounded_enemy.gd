extends CharacterBody2D


@export var SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	var direction = 1
	
	if is_on_wall():
		direction = -1
	
	if direction:
		velocity.x = direction * SPEED
	
	
		

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		self.queue_free()
