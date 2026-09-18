class_name StateMachine
extends Node

@export var current_state: BaseState
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is BaseState:
			child.state_machine = self
			states[child.name] = child
			child.transition.connect(on_state_transition)
		else:
			push_warning("State machine contains a non state child node")
	
	await owner.ready
	
	if not current_state:
		push_error("No Initial State Set")
	
	current_state.enter()
	
func _process(delta):
	current_state.update(delta)

func _physics_process(delta):
	current_state.physics_update(delta)

func on_state_transition(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			current_state = new_state
			current_state.enter()
	else:
		push_warning("State does not exist")
	
