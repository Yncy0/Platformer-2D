class_name DaBee extends AirborneEnemy


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0
@export var is_patroling: bool = false


@onready var projectile = preload("res://scene/items/stinger.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var projectile_spawn: Node2D = $ProjectileSpawn

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	animated_sprite_2d.play("idle")


func _physics_process(_delta: float) -> void:
	if ray_cast_2d.is_colliding():
		var r = ray_cast_2d.get_collider()
		if r is Player:
			spawn_projectile()
	
	move_and_slide()


func spawn_projectile() -> void:
	var s = projectile.instantiate()
	projectile_spawn.add_child(s)
	s.transform = projectile_spawn.global_transform
