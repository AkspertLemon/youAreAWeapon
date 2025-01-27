extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("move_a"):
		$Camera2D/AnimationPlayer.play("camera_movement")
