extends Node

class_name Gravity

@export var gravity: float = 0.0


func apply_gravity(body: CharacterBody2D, delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
