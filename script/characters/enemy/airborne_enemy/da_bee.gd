class_name DaBee extends AirborneEnemy


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0
@export var is_patroling: bool = false


@onready var projectile = preload("res://scene/items/stinger.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var projectile_spawn: Node2D = $ProjectileSpawn
@onready var shoot_timer: Timer = $ShootTimer


var shoot_available: bool = true


func _ready() -> void:
	animated_sprite_2d.play("idle")


func _physics_process(_delta: float) -> void:
	if ray_cast_2d.is_colliding():
		var r = ray_cast_2d.get_collider()
		if r is Player and shoot_available:
			spawn_projectile()
			shoot_available = false
			shoot_timer.start(1.0)
	
	move_and_slide()


func spawn_projectile() -> void:
	var s = projectile.instantiate()
	projectile_spawn.add_child(s)
	s.transform = projectile_spawn.global_transform


func _on_shoot_timer_timeout() -> void:
	shoot_available = true
