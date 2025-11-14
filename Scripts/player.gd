extends CharacterBody2D


@export var ACC: float = 300.0
@export var SPEED_CAP: float = 1000.0 

func _physics_process(delta: float) -> void:
	var h_dir = Input.get_axis("ui_left", "ui_right")
	var v_dir = Input.get_axis("ui_up", "ui_down")
	
	

	move_and_slide()
