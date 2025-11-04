class_name WalkState extends State

@export var move_speed : float = 100.0
@export var next_state : State = null
@onready var attack: AttackState = $"../Attack"
@onready var idle: IdleState = $"../Idle"

@export var anim_name = "walk"

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
	if _event.is_action_pressed("attack"):
		return attack
	return null
		
