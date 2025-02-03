extends Node2D

var circuits = 6


func _on_circuit_animation_changed() -> void:
	circuits -= 1
	print(circuits)
	if circuits==0:core_check()
func core_check()-> void:
	TransitonScreen.transition()
	await TransitonScreen.on_transition_finished
	get_tree().change_scene_to_file("res://levels/victory.tscn")
	#
