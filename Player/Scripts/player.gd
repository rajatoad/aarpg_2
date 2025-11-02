class_name Player extends CharacterBody2D

@export var move_speed := 200.0
var direction := Vector2.ZERO

@onready var animation_player = $AnimationPlayer

func _ready():
	pass

func _process(_delta):
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	
	velocity = direction * move_speed * _delta
	pass

func _physics_process(delta):
	move_and_slide()

func update_animation(action : String = "idle") -> void:
	#var direction_string : String = get_direction()
	
	#animation_player.play(action + "_" + direction_string)
	pass

#func get_direction() -> String:
	#if direction.x 
