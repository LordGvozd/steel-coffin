extends CharacterBody2D


@export_subgroup("Nodes")
@export var gravity_node: Gravity
@export var player_input_node: PlayerInput
@export var player_movement_node: PlayerMovement


func _physics_process(delta: float) -> void:
	player_movement_node.apply_horizontal_movement(
		self,
		player_input_node.horizontal_input
	)
	
	if player_input_node.is_jump_pressed:
		player_movement_node.apply_jump_movement(self)
	
	gravity_node.apply_gravity(self, delta)
	
	move_and_slide()
