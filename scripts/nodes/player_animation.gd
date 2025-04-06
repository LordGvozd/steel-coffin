extends Node

class_name PlayerAnimation


@export var animated_sprite: AnimatedSprite2D


func play_idle() -> void:
	animated_sprite.play("idle")


func play_walk(input) -> void:
	if input < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
		
	animated_sprite.play("walk")
