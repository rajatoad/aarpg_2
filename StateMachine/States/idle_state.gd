class_name IdleState extends State

@export var next_state : State = null
@export var anim_name = "idle"

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
