class_name DaBeeFlight extends DaBee


@onready var ray_cast_2d: RayCast2D = $RayCast2D


var direction: int = -1


func _ready() -> void:
	projectile_spawn = $ProjectileSpawn
	shoot_timer = $ShootTimer


func _physics_process(_delta: float) -> void:
	
	if ray_cast_2d.is_colliding():
		if ray_cast_2d.get_collider() == Player:
			print("NIGGA")
	
	velocity.x = direction * SPEED

	move_and_slide()
