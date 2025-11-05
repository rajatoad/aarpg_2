class_name PlayerEntity extends Entity

func _ready():
	PlayerManager.player = self
	state_machine.Initialize(self)
	pass

#func _process(_delta):
	#update_input_direction()
#
#func update_input_direction() -> void:
	#direction = Vector2(
		#Input.get_axis("left", "right"),
		#Input.get_axis("up", "down")
	#).normalized()
