extends Node

class_name ReplicaSystem


@export var replica_label: Label
@export var replica_animation_player: AnimationPlayer
@export var audio_stream_player: AudioStreamPlayer


var is_replica_animation_playing: bool = false


func set_replica_text(text: String) -> void:
	if not is_replica_animation_playing:
		replica_label.text = text
		

func set_replica_audio(path: String) -> void:
	audio_stream_player.stream = load(path)
	

func play_replica_typewriter_animation() -> void:
	replica_animation_player.play("typewriter")
	audio_stream_player.play()
	is_replica_animation_playing = true


func _on_replica_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "typewriter":
		audio_stream_player.stop()
		is_replica_animation_playing = false
