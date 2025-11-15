extends Enemy
class_name Turret

@export var anim_player: AnimationPlayer
@export var bullet_number: int = 4
var relative_rotation: float = 0

func _ready():
	anim_player.play("turret_shoot")
	pass



func create_bullets():
	if projectile_holder != null:	
		for i in range(bullet_number):
			var projectile = projectile_scene.instantiate()
			projectile_holder.add_child(projectile)
			projectile.position = position
			var angle: float = deg_to_rad((i * 360)/bullet_number)+deg_to_rad(relative_rotation*(180/bullet_number))
			print(angle)
			projectile.normalised_vector = Vector2.from_angle(angle)
			

func set_relative_rotation(arg: float):
	relative_rotation = arg
