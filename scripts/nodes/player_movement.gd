extends Node

class_name PlayerMovement


@export var speed: float = 0.0
@export var jump_velocity: float = 0.0


func apply_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	body.velocity.x = direction * speed


func apply_jump_movement(body: CharacterBody2D) -> void:
	if body.is_on_floor():
		body.velocity.y -= abs(jump_velocity)
