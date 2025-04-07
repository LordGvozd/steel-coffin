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
		
		Indicators.update_indicator(i, "value", indicator.value - decrease)
	timer.start()
		
