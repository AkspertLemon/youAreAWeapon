extends Node2D

func _on_camera_zoom_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		create_tween().tween_property($BombPlayer/Camera2D,"zoom",Vector2(0.7,0.7),0.7)


func _on_enemy_button_body_entered(body: Node2D) -> void:
	TransitonScreen.transition()
	await  TransitonScreen.on_transition_finished
	get_tree().reload_current_scene()


func _on_enemy_button_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"): $EnemyButton.queue_free()
	
