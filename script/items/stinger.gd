extends Projectiles

@onready var explosion_particles: CPUParticles2D = $ExplosionParticles
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		explosion_particles.emitting = true
		disable_visuals(animated_sprite_2d, hitbox)


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body:
		explosion_particles.emitting = true
		disable_visuals(animated_sprite_2d, hitbox)


func _on_explosion_particles_finished() -> void:
	self.queue_free()
