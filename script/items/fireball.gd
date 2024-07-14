extends Projectiles


@onready var explosion_particles: CPUParticles2D = $ExplosionParticles
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area:
		animated_sprite_2d.visible = false
		explosion_particles.emitting = true
		hitbox.queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body:
		animated_sprite_2d.visible = false
		explosion_particles.emitting = true
		hitbox.queue_free()
		


func _on_explosion_particles_finished() -> void:
	self.queue_free()
