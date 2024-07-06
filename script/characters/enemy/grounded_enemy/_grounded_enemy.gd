class_name GroundedEnemy extends CharacterBody2D


@export var SPEED = 300.0


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var health_component: HealthComponent = $HealthComponent


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float = 1.0
var is_hurt: bool = false

enum STATES {
	WANDER,
	HIT,
	DEAD
}

var current_state = STATES.WANDER


func change_state(new_state) -> void:
	current_state = new_state


func _ready() -> void:
	pass
	#health_component.connect("no_health", dead)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	match current_state:
		STATES.WANDER:
			wandering()
		STATES.HIT:
			hit()
		STATES.DEAD:
			dead()
	
	
	move_and_slide()


func wandering() -> void:
	animated_sprite_2d.play("idle")
	if is_on_wall() or ray_cast_2d.is_colliding() == false:
		direction *= -1.0
	
	velocity.x = direction * SPEED
	
	if is_hurt == true:
		change_state(STATES.HIT)


func hit() -> void:
	velocity.x = 0.0
	animated_sprite_2d.play("hit")
	
	if is_hurt == false:
		change_state(STATES.WANDER)
	
	if health_component.health <= 0:
		change_state(STATES.DEAD)


func dead() -> void:
	velocity.x = 0.0
	animated_sprite_2d.play("dead")
	animation_player.play("dead")


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area:
		health_component.health -= 1
		is_hurt = true


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "hit":
		is_hurt = false
