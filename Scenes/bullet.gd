extends Area2D

var speed: float
var normalised_vector: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# this code sucks, proof of concept, we're probably going to use CharacterBody2D anyways because we can affect angle
	position += speed * normalised_vector * delta
	pass


func _on_area_entered(area: Area2D) -> void:
	if area is Border:
		print("Killing myself")
		self.queue_free()
	
	pass # Replace with function body.
