extends Node2D

@export var increase_to: int = 5
@export var indicator: Indicators.indicators

@export var basic_sound: AudioStream
#@export var max_sound: AudioStream

@onready var audio_player = $AudioStreamPlayer2D

var player_in_range: bool
var replica_system: ReplicaSystem

var is_playing = false

func _ready() -> void:
	audio_player.connect("finished", _on_audio_finished)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = true
		replica_system = area.get_parent().get_node("ReplicaSystem")

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		if Indicators.get_indicator(indicator).value + increase_to > 100:

			if not is_playing:
				Indicators.update_indicator(
					indicator,
			 		"value",
			 		100
				)
				replica_system.set_replica_text("It can't go higher")
				replica_system.set_replica_audio("res://audio/sounds/voice/it_cant_go_higer.wav")
				replica_system.play_replica_typewriter_animation()
				is_playing = true
			
		elif not is_playing:
			Indicators.update_indicator(
				indicator,
			 	"value",
			 	Indicators.get_indicator(indicator).value + increase_to
			)
			audio_player.stream = basic_sound
			audio_player.play()
			is_playing = true
		
		
func _on_audio_finished() -> void:
	is_playing = false

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = false
		is_playing = false
