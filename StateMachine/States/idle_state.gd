class_name IdleState extends State

@export var anim_name = "idle"
@export var walk: WalkState
@export var attack: AttackState

var is_player : bool = false

@export_category("AI")
@export var state_duration_min : float = 0.5
@export var state_duration_max : float = 1.5


var _timer : float = 0.0

func Initialize() -> void:
	if entity is PlayerEntity:
		is_player = true

func Enter() -> void:
	if is_player:
		entity.update_animation(anim_name)
	else:
		entity.velocity = Vector2.ZERO
		_timer = randf_range(state_duration_min, state_duration_max)
		entity.update_animation(anim_name)


func Exit() -> void:
	pass

func Process(_delta) -> State:
	if is_player:
		if entity.direction != Vector2.ZERO:
			return walk
		entity.velocity = Vector2.ZERO
	else:
		_timer -= _delta
		if _timer <= 0:
			return next_state
	return null

func Physics(_delta) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("attack") and entity is PlayerEntity:
		return attack
	return null
