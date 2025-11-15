extends Enemy
class_name SubwayTank

@export var player : Player

func _physics_process(delta: float) -> void:
	if player != null:
		look_at(player.position)
		position += Vector2(player.position - position).normalized()*movement_speed*delta
	
func create_bullets(): 
	if projectile_holder != null:	
		var projectile = projectile_scene.instantiate()
		projectile_holder.add_child(projectile)
		projectile.position = position
		if player != null:
			projectile.normalised_vector = Vector2(player.position - position).normalized()
