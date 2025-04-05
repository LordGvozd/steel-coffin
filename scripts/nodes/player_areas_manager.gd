extends Node

class_name PlayerAreasManager


# Is used to provide information about 
# what the player is in contact with.

var ladder: bool = false
var device: bool = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("ladder"):
		ladder = true
	elif area.is_in_group("device"):
		device = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("ladder"):
		ladder = false
	elif area.is_in_group("device"):
		device = false
