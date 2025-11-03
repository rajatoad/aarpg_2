extends Node

var player : Entity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_player()


func get_player() -> Entity:
	for p in get_tree().root.get_children():
		if p is Entity:
			return p
	return null
