extends Node

var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_player()



func get_player() -> Player:
	for p in get_tree().root.get_children():
		if p is Player:
			return p
	return null
