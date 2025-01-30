extends Control

func _on_button_pressed() -> void:
	TransitonScreen.transition()
	await TransitonScreen.on_transition_finished
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
func _ready() -> void:
	$Camera2D/AnimationPlayer.play("camera_movement")
