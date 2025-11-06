class_name AttackState extends State

#@export var next_state : State = null
@export var anim_name = "attack"
@export_range(1,20,0.5) var decelerate_speed : float = 5.0
@onready var hurt_box: HurtBox = %HurtBox

@onready var idle: IdleState = $"../Idle"
@onready var walk: WalkState = $"../Walk"
var animation_player: AnimationPlayer

var is_player : bool = false

var is_attacking : bool = false

func Initialize() -> void:
	if entity is PlayerEntity:
		is_player = true

func Enter() -> void:
	entity.update_animation(anim_name)
	animation_player = entity.animation_player
	animation_player.animation_finished.connect(finish_attack)
	is_attacking = true
	
	#hurt_box.monitoring = true
	#get_tree().create_timer(0.8).timeout.connect(finish_attack)
	pass

func Exit() -> void:
	is_attacking = false
	animation_player.animation_finished.disconnect(finish_attack)
	pass

func Process(_delta) -> State:
	entity.velocity -= entity.velocity * decelerate_speed * _delta
	
	if not is_attacking:
		if entity.set_direction():
			return walk
		else:
			return idle
	return null

func Physics(_delta) -> State:
	return null

func finish_attack( _newAnimationName : String) -> void:
	is_attacking = false
	pass
