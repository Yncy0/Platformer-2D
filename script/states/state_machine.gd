class_name StateMachine extends Node

@export var current_state: States


var states: Dictionary = {}


func _ready() -> void:
	for i in get_children():
		if i is States:
			states[i.name.to_lower()] = i
			i.change_state.connect(next_state)
		else:
			printerr("Nodes is not existing")
	await owner.ready
	current_state.enter()
	


func _unhandled_input(event: InputEvent) -> void:
	current_state.update_input(event)


func _process(delta: float) -> void:
	current_state.update_process(delta)


func _physics_process(delta: float) -> void:
	current_state.update_physics_process(delta)



func next_state(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name.to_lower())
	
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
			print(current_state)
		else:
			printerr("Nodes doesn't match the next state %s" % new_state)
	else:
		printerr("The new state is null")
