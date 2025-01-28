extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
func _ready() -> void:
	$Camera2D/AnimationPlayer.play("camera_movement")

		
