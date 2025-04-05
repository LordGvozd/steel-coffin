extends Node

class_name PlayerMovement


@export var speed: float = 0.0
@export var ladder_speed: float = 0.0
@export var jump_velocity: float = 0.0


func apply_horizontal_movement(body: CharacterBody2D, input: float) -> void:
	body.velocity.x = input * speed


func apply_jump_movement(body: CharacterBody2D) -> void:
	if body.is_on_floor():
		body.velocity.y -= abs(jump_velocity)
		

func apply_ladder_movement(body: CharacterBody2D, input: float) -> void:
	if input != 0.0:
		body.velocity.y = input * ladder_speed
	else:
		body.velocity.y = 0.0
