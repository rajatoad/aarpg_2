class_name HurtBox extends Area2D

@export var damage : int = 1
#
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect( AreaEntered)
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#if monitoring:
		#for c in get_overlapping_areas():
			#if c is HitBox:
				#c.trigger_damage(self)

func AreaEntered(area_2d : Area2D) -> void:
	if area_2d is HitBox:
		area_2d.trigger_damage(self)
	return
