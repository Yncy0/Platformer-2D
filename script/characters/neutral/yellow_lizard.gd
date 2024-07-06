extends CharacterBody2D


@export var speed: float = 100.0


@onready var ray_cast_2d: RayCast2D = $RayCast2D



var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: int = 1


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_wall() or ray_cast_2d.is_colliding() == false:
		direction *= -1
	
	velocity.x = direction * speed
	
	move_and_slide()



func _on_mount_area_body_entered(body: Node2D) -> void:
	if body is Player:
		pass
