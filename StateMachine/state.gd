class_name State extends Node

var entity: Entity
var state_machine : StateMachine
@export var next_state : State


func _ready():
	pass

func Initialize() -> void:
	pass

func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Process(_delta : float) -> State:
	return null

func Physics(_delta : float) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	return null
