class_name DaBee extends AirborneEnemy


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0
@export var is_patroling: bool = false


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	animated_sprite_2d.play("idle")


func _physics_process(delta: float) -> void:
	
	
	move_and_slide()
