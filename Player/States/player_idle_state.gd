class_name PlayerIdleState extends State

var player: Player = null

@export var next_state : State = null
var anim_name = "idle"

func Initialize() -> void:
	if player == null:
		player = PlayerManager.player
	pass

func Enter() -> void:
	player.velocity = Vector2.ZERO
	player.anim_name = anim_name
	pass

func Exit() -> void:
	pass

func Process(_delta) -> State:
	var current_d = player.current_direction
	if current_d != player.get_direction():
		return next_state
	return null

func Physics(_delta) -> State:
	return null
