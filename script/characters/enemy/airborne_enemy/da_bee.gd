class_name DaBee extends AirborneEnemy


@export var SPEED: float = 300.0
@export var is_patroling: bool = false


@onready var projectile = preload("res://scene/items/stinger.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var projectile_spawn: Node2D = $ProjectileSpawn
@onready var shoot_timer: Timer = $ShootTimer


var shoot_available: bool = true
var player_detected: bool = false


func _ready() -> void:
	animated_sprite_2d.play("idle")


func _physics_process(_delta: float) -> void:
	if player_detected and shoot_available:
		shoot_available = false
		spawn_projectile()
		shoot_timer.start(1.0)
	
	move_and_slide()


func spawn_projectile() -> void:
	var s = projectile.instantiate()
	projectile_spawn.add_child(s)
	s.transform = projectile_spawn.global_transform


func _on_shoot_timer_timeout() -> void:
	shoot_available = true


func _on_player_detect_body_entered(body: Node2D) -> void:
	if body is Player:
		player_detected = true


func _on_player_detect_body_exited(body: Node2D) -> void:
	if body is Player:
		player_detected = false


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		self.queue_free()
