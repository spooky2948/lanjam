extends Enemy
class_name Sniper

@export var player: Player
@export var ROTATION_SPEED: float = 1


@export var animation_delay: Timer
@export var line: Line2D
@export var anim_player: AnimationPlayer
var look = true
var bullet_vector: Vector2

func _ready():
	var rand_float = randf_range(0,0.1)
	animation_delay.start(rand_float)

func _physics_process(delta: float) -> void:
	if player != null and look == true:
		look_at(player.position)
	
func create_bullets(): 
	if projectile_holder != null:	
		var projectile = projectile_scene.instantiate()
		projectile_holder.add_child(projectile)
		projectile.position = position
		if player != null:
			projectile.normalised_vector = bullet_vector

func set_line_position():
	if player != null:
		var length_to_player = Vector2(player.position.x-position.x,player.position.y-position.y).length()
		line.set_point_position(1,Vector2(length_to_player + 1000,0))
		
func set_look(vr: bool):
	if player != null:
		bullet_vector = Vector2(player.position - position).normalized()
		look = vr



func _on_animation_delay_timeout() -> void:
	anim_player.play("shoot_bullet")
	pass # Replace with function body.
