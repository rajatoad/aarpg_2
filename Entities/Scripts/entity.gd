class_name Entity extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var player : PlayerEntity

@export var hp : int = 6
@export var max_hp : int = 6

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_machine: StateMachine = $StateMachine

signal DirectionChanged( new_direction : Vector2)
signal damaged()

var invulnerable = false


func _ready():
	state_machine.Initialize(self)
	player = PlayerManager.player
	pass

func _process(_delta):
	update_direction()

func _physics_process(_delta):
	move_and_slide()

func take_damage(damage : int) -> void:
	if not invulnerable:
		hp -= clampi(hp - damage, 0, max_hp)
		invulnerable = true
	await get_tree().create_timer(0.5).timeout
	invulnerable = false

func update_animation(state: String) -> void:
	animation_player.play(state + "_" + anim_direction())

func set_direction(_new_direction : Vector2 = Vector2.ZERO) -> bool:
	if self is not PlayerEntity:
		direction = _new_direction
	if direction == Vector2.ZERO:
		return false
	
	# Bias direction towards cardinal direction (already up will favor up)
	var direction_id : int = int( round( (direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size() ) )
	var new_dir : Vector2 = DIR_4[direction_id]
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	DirectionChanged.emit(new_dir)
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true

func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

func update_direction() -> void:
	if self == PlayerManager.player:
		direction = Vector2(
			Input.get_axis("left", "right"),
			Input.get_axis("up", "down")
		).normalized()
	#else:
		#direction = Vector2(
			#randf_range(-1.0, 1.0),
			#randf_range(-1.0, 1.0)
		#)
