extends Node2D

@onready
var timer = $Timer
@onready
var audio_player = $AudioStreamPlayer2D

@export
var sound: AudioStream

func _ready() -> void:
	timer.wait_time = 10
	audio_player.stream = sound
	timer.start()

func _on_timer_timeout() -> void:
	if ((randi() % 100) > 50) and (Indicators.get_indicator(Indicators.indicators.oxygen).value < 70):
		audio_player.play()
	timer.wait_time = 15
	timer.start()
