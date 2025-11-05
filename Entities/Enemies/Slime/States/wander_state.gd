class_name WanderState extends State

@export var anim_name = "walk"
@export var walk_speed : float = 20.0
@export var idle: IdleState
@export var attack: AttackState

var is_player : bool = false

@export_category("AI")
@export var state_animation_duration : float = 0.7
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 3

var _timer : float = 0.0
var _direction : Vector2

func Initialize() -> void:
	if entity is PlayerEntity:
		is_player = true

func Enter() -> void:
	if is_player:
		entity.update_animation(anim_name)
	else:
		_timer = randi_range(state_cycles_min, state_cycles_max) * state_animation_duration
		var rand = randi_range(0, 3)
		_direction = entity.DIR_4[rand]
		entity.velocity = _direction * walk_speed
		entity.set_direction(_direction)
		entity.update_animation(anim_name)
		

func Exit() -> void:
	pass

func Process(_delta) -> State:
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null

func Physics(_delta) -> State:
	return null
