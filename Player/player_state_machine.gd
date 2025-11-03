class_name PlayerStateMachine extends StateMachine

var states: Array[State] = []
var current_state : State = null
var previous_state : State = null

func Initialize() -> void:
	for s in get_children():
		if s is State:
			states.append(s)
			s.player = PlayerManager.player
	current_state = states[0]
	previous_state = states[0]
	current_state.Initialize()
	current_state.Enter()

func Process(_delta) -> void:
	var next_state = current_state.Process(_delta)
	if next_state == null:
		return
	else:
		previous_state = current_state
		current_state = next_state

func Physics(_delta) -> void:
	var next_state = current_state.Physics(_delta)
	if next_state == null:
		return
	else:
		previous_state = current_state
		current_state = next_state
