class_name Player extends CharacterBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY:float = -400.0
@export var bounce_velocity: float = -100.0


@onready var mounts: Dictionary = {
	"yellow_lizard": preload("res://scene/characters/neutral/yellow_lizard_mount.tscn").instantiate()
}
var mount_name: String 

@onready var projectiles: Dictionary = {
	"fireball": preload("res://scene/items/fireball.tscn")
}
var projectile_name: String = "fireball"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var mount_spawn: Node2D = $MountSpawn
@onready var projectile_spawn: Node2D = $ProjectileSpawn
@onready var sfx_hurt: AudioStreamPlayer = $SFXHurt
@onready var sfx_jump: AudioStreamPlayer = $SFXJump


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float

var is_riding: bool = false
var is_hurt: bool = false

func update_gravity(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up"):
		if is_riding:
			shooting()


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
		projectile_spawn.rotation_degrees = 180
	if Input.is_action_pressed("move_right"):
		animated_sprite_2d.flip_h = false
		projectile_spawn.rotation_degrees = 0


func bouncing() -> void:
	velocity.y = bounce_velocity


func jumping() -> void:
	velocity.y = JUMP_VELOCITY


func shooting() -> void:
	var s = projectiles[projectile_name].instantiate()
	projectile_spawn.add_child(s)
	s.transform = projectile_spawn.global_transform


func mount_despawning() -> void:
	mount_spawn.remove_child(mount_spawn.get_child(0))


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		bouncing()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		is_hurt = true
