class_name IdleState extends State

@export var next_state : State = null
@export var anim_name = "idle"
@onready var walk: WalkState = $"../Walk"
@onready var attack: AttackState = $"../Attack"

func Enter() -> void:
	entity.update_animation(anim_name)

func Exit() -> void:
	pass

func Process(_delta) -> State:
	if entity.direction != Vector2.ZERO:
		return next_state
	entity.velocity = Vector2.ZERO
	return null

func Physics(_delta) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
