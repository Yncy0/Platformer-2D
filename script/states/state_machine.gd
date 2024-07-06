class_name StateMachine extends Node

@export var current_state: States


var states: Dictionary = {}


func _ready() -> void:
	for i in get_children():
		if i is States:
			states[i.name] = i
			i.change_state.connect(next_state)
	
	await owner.ready
	current_state.enter()
	


func next_state(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
			#print(current_state)
