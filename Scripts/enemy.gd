extends CharacterBody2D
class_name Enemy

@export var projectile_scene: PackedScene = preload("res://Scenes/bullet.tscn")
@export var projectile_holder: Node2D



#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func _ready():
	pass


func create_bullets(): 
	if projectile_holder != null:	
		var projectile = projectile_scene.instantiate()
		var rand_x = randf_range(-1,1)
		var rand_y = randf_range(-1,1)
		projectile_holder.add_child(projectile)
		projectile.position = self.position
		projectile.normalised_vector = Vector2(rand_x,rand_y)
		projectile.speed = 670
