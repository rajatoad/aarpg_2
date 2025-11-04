class_name HitBox extends Area2D

var damage : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for c in get_overlapping_areas():
		if c is HurtBox:
			c.trigger_damage(self)
