class_name PlayerWalkState extends State

var player: Player = null

@export var move_speed : float = 100.0
@export var next_state : State = null
var anim_name = "walk"
var direction : Vector2 = Vector2.ZERO

func Initialize() -> void:
	if player == null:
		player = PlayerManager.player
	pass

func Enter() -> void:
	player.anim_name = anim_name
	pass

func Exit() -> void:
	pass

func Process(_delta) -> State:
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	
	player.velocity = direction * move_speed * _delta
	
	if player.velocity == Vector2.ZERO and direction == Vector2.ZERO:
		return next_state
	return null

func Physics(_delta) -> State:
	return null
