extends Area2D
class_name Bullet
@export var speed : float
var normalised_vector : Vector2
@export var dmg = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Being called!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# this code sucks, proof of concept, we're probably going to use CharacterBody2D anyways because we can affect angle
	position += speed * normalised_vector * delta
	pass


func _on_area_entered(area: Area2D) -> void:
	if area is Border:
		print("Bruh")
		self.queue_free()
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_dmg(dmg)
		self.queue_free()
