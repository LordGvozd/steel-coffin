extends Node

class_name ReplicaSystem


@export var replica_label: Label
@export var replica_animation_player: AnimationPlayer

var is_replica_animation_playing: bool = false


func set_replica_text(text: String) -> void:
	if not is_replica_animation_playing:
		replica_label.text = text
	

func play_replica_typewriter_animation() -> void:
	replica_animation_player.play("typewriter")
	is_replica_animation_playing = true


func _on_replica_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "typewriter":
		is_replica_animation_playing = false
