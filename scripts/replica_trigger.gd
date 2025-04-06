extends Area2D


@export var text: String = ""

var is_player_in_range: bool = false
var replica_system_node: ReplicaSystem


func _ready() -> void:
	replica_system_node = get_node("../Player/ReplicaSystem")


func _process(delta: float) -> void:
	if is_player_in_range and Input.is_action_just_pressed("interact"):
		replica_system_node.set_replica_text(text)
		replica_system_node.play_replica_typewriter_animation()
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = true
		

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_player_in_range = false
