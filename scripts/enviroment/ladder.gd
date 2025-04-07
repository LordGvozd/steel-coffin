extends Area2D


@export_file("*.tscn") var scene_path: String
@export var scene_switch_animation: Node2D

var is_player_in_range: bool = false
var animation_player: AnimationPlayer


func _ready() -> void:
	animation_player = scene_switch_animation.get_node("AnimationPlayer")
	animation_player.connect("animation_finished", _on_animation_finished)


func _process(delta: float) -> void:
	if is_player_in_range and Input.is_action_just_pressed("interact"):
		animation_player.play("fade_in")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		get_tree().change_scene_to_file(scene_path) 
		

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = true


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = false
