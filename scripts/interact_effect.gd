extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		var shader_material = ShaderMaterial.new()
		
		shader_material.shader = load("res://shaders/outline.gdshader")
		shader_material.set_shader_parameter("width", 1)
		shader_material.set_shader_parameter("outline_color", Color(255, 255, 255))
		shader_material.set_shader_parameter("flickering_speed", 6)
		
		get_parent().material = shader_material
		

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_parent().material = null
