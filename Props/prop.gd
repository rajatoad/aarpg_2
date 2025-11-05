class_name Prop extends Node2D

@onready var hit_box: HitBox = $HitBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_box.Damaged.connect(TakeDamage)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func TakeDamage( _damage : int) -> void:
	queue_free()
