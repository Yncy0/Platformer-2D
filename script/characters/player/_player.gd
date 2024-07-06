class_name Player extends CharacterBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY:float = -400.0
@export var bounce_velocity: float = -100.0


@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float


func _ready() -> void:
	animation_player.play("idle")


func _physics_process(delta: float) -> void:
	update_gravity(delta)
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumping()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#direction = Input.get_axis("move_left", "move_right")
	#if direction:
		#moving()
	#else:
		#idling()

	move_and_slide()


func update_gravity(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


func idling() -> void:
	velocity.x = move_toward(velocity.x, 0, SPEED)


func moving() -> void:
	velocity.x = direction * SPEED


func bouncing() -> void:
	velocity.y = bounce_velocity


func jumping() -> void:
	velocity.y = JUMP_VELOCITY



func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		bouncing()
