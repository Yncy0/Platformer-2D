class_name Player extends CharacterBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY:float = -400.0
@export var bounce_velocity: float = -100.0


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float


func update_gravity(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


func idling() -> void:
	velocity.x = move_toward(velocity.x, 0, SPEED)


func moving() -> void:
	direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		idling()
	
	moving_sprite_flip()


func moving_sprite_flip() -> void:
	if Input.is_action_pressed("move_left"):
		animated_sprite_2d.flip_h = true
	if Input.is_action_pressed("move_right"):
		animated_sprite_2d.flip_h = false


func bouncing() -> void:
	velocity.y = bounce_velocity


func jumping() -> void:
	velocity.y = JUMP_VELOCITY


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		bouncing()
