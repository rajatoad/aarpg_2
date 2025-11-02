class_name PlayerIdleState extends State

@onready var player: Player = $"."


func Initialize() -> void:
	
	pass

func Enter() -> void:
	player.velocity = Vector2.ZERO
	pass

func Exit() -> void:
	pass

func Process(_delta) -> void:
	pass

func Physics(_delta) -> void:
	pass
