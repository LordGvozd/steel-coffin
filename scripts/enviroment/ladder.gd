extends Area2D


@export_file("*.tscn") var scene_path: String
@export var scene_switch_animation: Node2D

var is_player_in_range: bool = false


func _process(delta: float) -> void:
	if is_player_in_range and Input.is_action_just_pressed("interact"):
		scene_switch_animation.get_node("AnimationPlayer").play("fade_in")
		get_tree().change_scene_to_file(scene_path)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = true


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = false
