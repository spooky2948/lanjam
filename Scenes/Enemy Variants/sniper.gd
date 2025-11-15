extends Enemy
class_name Sniper

@export var player: Player
@export var ROTATION_SPEED: float = 1

func _physics_process(delta: float) -> void:
	if player != null:
		var vector = Vector2(position)
		
		# fuck knows how to do this, it's because angles loop between -PI and PI so rotation is a bit silly 
		var move_to = vector.angle_to_point(player.position)
		rotation = lerp(rotation,move_to,ROTATION_SPEED * delta)

	
