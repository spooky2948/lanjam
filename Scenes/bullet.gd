extends Area2D

var speed: float
var x_val: float 
var y_val :float 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# this code sucks, proof of concept, we're probably going to use CharacterBody2D anyways because we can affect angle
	position += Vector2(speed*delta*x_val,speed*delta*y_val)
	pass
