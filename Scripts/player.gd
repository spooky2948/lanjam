extends CharacterBody2D
class_name Player

@export var ACC_RATIO : float = 2
@export var DECEL_RATIO: float = 4
@export var SPEED_CAP: float = 1000.0 

func _physics_process(delta: float) -> void:
	var accel = ACC_RATIO*SPEED_CAP
	var decel = DECEL_RATIO*SPEED_CAP
	
	var x = Input.get_axis("ui_left", "ui_right")
	var y = Input.get_axis("ui_up", "ui_down")
	
	var dir : Vector2 = Vector2(x, y).normalized()
	var dv = accel*delta*dir
	
	velocity += dv
	if (velocity + dv).length() >= SPEED_CAP:
		velocity = velocity.normalized() * SPEED_CAP
		
	if x == 0:
		velocity.x = move_toward(velocity.x, 0, delta*decel)
	if y == 0:
		velocity.y = move_toward(velocity.y, 0, delta*decel)
	 
	move_and_slide()

func die():
	self.queue_free()
