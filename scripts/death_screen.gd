extends Node2D


func _on_animated_sprite_2d_animation_finished() -> void:
	var animation_player = get_node("SceneSwitchAnimation/AnimationPlayer")
	animation_player.connect("animation_finished", _on_animation_finished)
	animation_player.play("fade_in")
	

func _on_animation_finished(anim_name: String) -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
