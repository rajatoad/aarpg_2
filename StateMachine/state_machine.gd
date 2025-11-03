class_name StateMachine extends Node

var states : Array[State]
var prev_state : State
var current_state : State

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

func Initialize(_entity : Entity) -> void:
	states = []
	for s in get_children():
		if s is State:
			states.append(s)
	if states.size() > 0:
		for s in states:
			s.entity = _entity
		ChangeState( states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func _unhandled_input(event):
	ChangeState(current_state.HandleInput(event))

func _process(delta):
	ChangeState(current_state.Process(delta))

func _physics_process(delta):
	ChangeState(current_state.Physics(delta))

func ChangeState(new_state : State) -> void:
	if new_state == current_state || new_state == null:
		return
	
	if current_state:
		current_state.Exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.Enter()
