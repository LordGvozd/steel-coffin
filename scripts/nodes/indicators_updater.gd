extends Node

@onready
var timer = $Timer

@export
var delay = 60

@export 
var decrease = 3

func _ready() -> void:
	timer.wait_time = delay
	timer.start()

func _on_timer_timeout() -> void:
	for i in Indicators.indicators.values():	
		var indicator = Indicators.get_indicator(i)
		
		if indicator.value - decrease <= 0:
			# DEATHee
			for j in Indicators.indicators.values():	
				#var ind = Indicators.get_indicator(j)
				Indicators.update_indicator(j, "value", 70)
			
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
			return
			
			
		Indicators.update_indicator(i, "value", indicator.value - decrease)
	timer.start()
		
