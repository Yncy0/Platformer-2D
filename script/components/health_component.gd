class_name HealthComponent extends Node


signal no_health
#signal changed_health(value: int)
#signal changed_max_health(value: int)


@export var max_health: int: set = set_max_health
@onready var health: int = max_health: set = set_health


func set_max_health(value: int) -> void:
	max_health = value
	health = min(health, max_health)
	


func set_health(value: int) -> void:
	health = value
	
	if value <= 0 :
		emit_signal("no_health")



