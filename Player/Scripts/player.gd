class_name Player extends CharacterBody2D

var anim_name : String = "walk"
var current_direction : String = "down"

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine

func _ready():
	player_state_machine.Initialize()
	pass

func _process(_delta):
	if Input.is_action_pressed("right"):
		sprite_2d.scale.x = 1
	elif Input.is_action_pressed("left"):
		sprite_2d.scale.x = -1
	
	player_state_machine.Process(_delta)
	update_animation()
	pass

func _physics_process(_delta):
	player_state_machine.Physics(_delta)
	move_and_slide()

func update_animation() -> void:
	var direction_string : String = get_direction()
	
	print(anim_name + "_" + direction_string)
	animation_player.play(anim_name + "_" + direction_string)
	await animation_player.animation_finished
	pass

func get_direction() -> String:
	
	#if abs(direction.x) >= abs(direction.y):
		#current_direction = "side"
	#elif direction.y > 0:
		#current_direction = "down"
	#elif direction.y < 0:
		#current_direction = "up"
	#return current_direction
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		current_direction = "side"
	elif Input.is_action_pressed("up"):
		current_direction = "up"
	elif Input.is_action_pressed("down"):
		current_direction = "down"
	return current_direction
	
