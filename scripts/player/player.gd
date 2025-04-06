extends CharacterBody2D


@export_subgroup("Nodes")
@export var gravity_node: Gravity
@export var player_input_node: PlayerInput
@export var player_movement_node: PlayerMovement
@export var player_animation_node: PlayerAnimation
@export var player_audio_node: PlayerAudio

@export var replica_system_node: ReplicaSystem


func _physics_process(delta: float) -> void:
	if not replica_system_node.is_replica_animation_playing:
		if player_input_node.horizontal_input != 0.0:
			player_animation_node.play_walk(player_input_node.horizontal_input)
			if player_audio_node.audio_stream_player.playing == false:
				player_audio_node.play_footsteps()
		else:
			player_animation_node.play_idle()
			player_audio_node.stop()
		
		player_movement_node.apply_horizontal_movement(
			self,
			player_input_node.horizontal_input
		)
		
		if player_input_node.is_jump_pressed:
			player_movement_node.apply_jump_movement(self)
	else:
		player_movement_node.reset_horizontal_movement(self)
		player_animation_node.play_idle()
		player_audio_node.stop()

	gravity_node.apply_gravity(self, delta)
	move_and_slide()
