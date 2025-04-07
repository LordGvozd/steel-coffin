extends Sprite2D


@export var positions: Array[Node2D] = []
@export var audio_player: AudioStreamPlayer

var current_index: int = 0


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ladder_up"):
		current_index -= 1
		audio_player.play()
	
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ladder_down"):
		current_index += 1
		audio_player.play()
	
	if current_index > len(positions) - 1:
		current_index = len(positions) - 1
	
	if current_index < 0:
		current_index = 0
	
	self.position = positions[current_index].position
	
	if Input.is_action_just_pressed("ui_accept"):
		match current_index:
			0:
				get_tree().change_scene_to_file("res://scenes/submarine/oxygen.tscn")
			2:
				get_tree().quit()
		
