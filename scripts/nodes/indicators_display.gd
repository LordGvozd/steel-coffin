extends Node2D

var _is_player_in_range: bool = false
var is_display_open: bool = false

@export
var display_label: Label
@export 
var control: Control


func _ready() -> void:
	control.visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		_is_player_in_range = true

func _process(delta: float) -> void:
	if (
		_is_player_in_range
		and not is_display_open
		and Input.is_action_just_pressed("interact")
		):
		var string_to_display = ""
		var indicator
		for i in Indicators.indicators.values():

			indicator = Indicators.get_indicator(i)
			string_to_display += (str(indicator.display_name) + ": "
								 + str(indicator.value)
								 + "\n")
		display_label.text = string_to_display
		control.visible = true
		
func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		_is_player_in_range = false
		control.visible = false
