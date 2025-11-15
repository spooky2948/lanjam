extends CharacterBody2D
class_name Player

## acceleration ratio 
@export var ACC_RATIO : float = 2
@export var DECEL_RATIO : float = 4
@export var SPEED_CAP : float = 1000.0 
@export var MAX_HP : float = 100

var health : float = MAX_HP
var armour : float = 0
var dmg_cooldown : int = 0

signal health_change(prev_hp: float, new_hp : float)
signal send_initial_health(hlth: float, max_health : float)

func _ready():
	send_initial_health.emit(health,MAX_HP)

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
	
	if dmg_cooldown > 0:
		dmg_cooldown -= 1
	move_and_slide()

## gets called whenever player takes damage
func take_dmg(n):
	if dmg_cooldown == 0:
		var prev_health = health
		health -= n*(1-armour)
		print(health)
		health_change.emit(prev_health, health)
		dmg_cooldown = 4
		if health <= 0:
			self.die()

func die() -> void:
	self.queue_free()
