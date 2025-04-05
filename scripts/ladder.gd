extends Area2D


@export_file("*.tscn") var scene_path: String

var player_in_range: bool = false


func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(scene_path)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = true


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = false
