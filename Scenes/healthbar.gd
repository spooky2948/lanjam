extends TextureProgressBar
class_name Healthbar


var current_hp: float 
var max_hp: float 
var health_tween: Tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_health_data(health: float, max_health: float):
	print("The health and the max health are:", health, max_health)
	current_hp = health
	max_hp = max_health
	max_value = max_hp
	value = current_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_health_change(prev_hp: float, new_hp: float) -> void:
	print("Health is being changed!!!")
	health_tween = get_tree().create_tween()
	health_tween.tween_property(self, "value", new_hp, 0.25)
	
	current_hp = new_hp
	pass
