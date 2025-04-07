extends Node2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/submarine/navigation.tscn")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/submarine/navigation.tscn")
