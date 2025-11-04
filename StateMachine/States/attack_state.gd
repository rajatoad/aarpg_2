class_name AttackState extends State

@export var next_state : State = null
@export var anim_name = "attack"
@onready var idle: IdleState = $StateMachine/Idle
@onready var walk: WalkState = $StateMachine/Walk
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_attacking : bool = false

func Enter() -> void:
	entity.update_animation(anim_name)
	animation_player.animation_finished.connect(finish_attack)
	is_attacking = true
	pass

func Exit() -> void:
	is_attacking = false
	pass

func Process(_delta) -> State:
	entity.velocity -= entity.velocity * _delta
	if not is_attacking:
		if entity.set_direction():
			return walk
		else:
			return idle
	return null

func Physics(_delta) -> State:
	return null

func finish_attack() -> void:
	is_attacking = false
	pass
