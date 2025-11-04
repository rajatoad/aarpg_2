class_name HurtBox extends Area2D

var entity : Entity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initialize(_entity: Entity) -> void:
	entity = _entity
	#area_entered.connect(trigger_damage)
	

func trigger_damage(hit_box : HitBox) -> void:
	#if _area is HitBox: 
	entity.take_damage(hit_box.damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#if not invulnerable:
		#for a in get_overlapping_areas():
			#if a is HitBox:
				#a.trigger_damage()
				#invulnerable = true
	#pass
