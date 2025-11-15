extends Enemy
class_name Sniper

@export var player: Player
@export var ROTATION_SPEED: float = 1

func _physics_process(delta: float) -> void:
	if player != null:
		look_at(player.position)
	
func create_bullets(): 
	if projectile_holder != null:	
		var projectile = projectile_scene.instantiate()
		projectile_holder.add_child(projectile)
		projectile.position = position
		if player != null:
			projectile.normalised_vector = Vector2(player.position - position).normalized()
