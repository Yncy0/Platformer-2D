extends CharacterBody2D


@export var speed: float = 100.0


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: int = 1


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_wall() or ray_cast_2d.is_colliding() == false:
		direction *= -1
	
	velocity.x = direction * speed
	
	sprite_flip()
	move_and_slide()


func sprite_flip() -> void:
	if direction == 1:
		animated_sprite_2d.flip_h = false
	if direction == -1:
		animated_sprite_2d.flip_h = true


func _on_mount_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.animated_sprite_2d.flip_h = false
		body.projectile_spawn.rotation_degrees = 0
		body.is_riding = true
		body.mount_name = "yellow_lizard"
		body.mount_spawn.add_child(body.mounts[body.mount_name])
		self.queue_free()
