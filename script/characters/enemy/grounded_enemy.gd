extends CharacterBody2D


@export var SPEED = 300.0


@onready var ray_cast_2d: RayCast2D = $RayCast2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction:int = 1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if is_on_wall() or ray_cast_2d.is_colliding() == false:
		direction = -1
	else:
		direction = 1
	
	
	velocity.x = direction * SPEED
	
	
	

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		self.queue_free()
