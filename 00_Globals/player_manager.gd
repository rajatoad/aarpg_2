extends Node

var player : PlayerEntity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_player()

func get_player() -> Entity:
	for p in get_tree().root.get_children():
		if p is Level:
			for s in p.get_children():
				if s is PlayerEntity:
					return s
	return null
