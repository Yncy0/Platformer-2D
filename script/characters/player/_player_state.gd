class_name PlayerState extends States

var player: Player

func _ready() -> void:
	await owner.ready
	
	player = owner as Player
