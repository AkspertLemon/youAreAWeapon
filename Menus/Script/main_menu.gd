extends Control



func _on_play_pressed() -> void:
	TransitonScreen.transition()
	await TransitonScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Story/StoryScene.tscn")


func _on_settings_pressed() -> void:
	print("Opened Settings")
