extends Node

class_name PlayerInput


var horizontal_input: float = 0.0
var ladder_input: float = 0.0
var is_jump_pressed: bool = false


func _process(delta: float) -> void:
	horizontal_input = Input.get_axis("move_left", "move_right")
	is_jump_pressed = Input.is_action_just_pressed("jump")
	ladder_input = Input.get_axis("ladder_up", "ladder_down")
