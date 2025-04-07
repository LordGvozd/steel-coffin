extends Node

class_name PlayerAudio


@export var audio_stream_player: AudioStreamPlayer


func play_footsteps() -> void:
	audio_stream_player.stream = load("res://sounds/194978__soundmary__footsteps-on-metal.mp3")
	audio_stream_player.play()


func stop() -> void:
	audio_stream_player.stop()
