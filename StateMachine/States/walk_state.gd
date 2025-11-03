class_name WalkState extends State

@export var move_speed : float = 100.0
@export var next_state : State = null
@export var anim_name = "walk"

func Enter() -> void:
	entity.update_animation(anim_name)
	pass

func Exit() -> void:
	pass

func Process(_delta) -> State:
	if entity.direction == Vector2.ZERO:
		return next_state
	entity.velocity = entity.direction * move_speed
	
	if entity.set_direction():
		entity.update_animation(anim_name)
	return null

func Physics(_delta) -> State:
	return null
