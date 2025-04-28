extends Node

class_name PlayerAudio


@export var audio_stream_player: AudioStreamPlayer
@export var step_sound: AudioStream


func play_footsteps() -> void:
	audio_stream_player.stream = step_sound
	audio_stream_player.play()


func stop() -> void:
	audio_stream_player.stop()
