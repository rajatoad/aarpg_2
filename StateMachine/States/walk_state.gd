class_name WalkState extends State

@export var move_speed : float = 100.0
#@export var next_state : State = null
@export var attack: AttackState
@export var idle: IdleState

@export var anim_name = "walk"

var is_player : bool = false

func Initialize() -> void:
	if entity is PlayerEntity:
		is_player = true

func Enter() -> void:
	entity.update_animation(anim_name)
	pass

func Exit() -> void:
	pass

func Process(_delta) -> State:
	if entity.direction == Vector2.ZERO:
		return idle
	entity.velocity = entity.direction * move_speed
	
	if entity.set_direction():
		entity.update_animation(anim_name)
	return null

func Physics(_delta) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("attack") and entity is PlayerEntity:
		return attack
	return null
		
