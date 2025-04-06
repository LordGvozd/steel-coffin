extends Area2D

class_name SceneSwitcher


@export_file("*.tscn") var scene
@export var scene_switch_animation: Node2D

var animation_player: AnimationPlayer
var is_animation_playing: bool = false


func _ready() -> void:
	animation_player = scene_switch_animation.get_node("AnimationPlayer")


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		animation_player.animation_finished.connect(_on_animation_finished)
		animation_player.play("fade_in")
		is_animation_playing = true


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		is_animation_playing = false
		get_tree().change_scene_to_file(scene)
		
