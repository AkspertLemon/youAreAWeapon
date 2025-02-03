extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_tween().tween_property($Motor1,"rotation",360,500)
	create_tween().tween_property($Motor2,"rotation",360,500)


func _on_cam_zoom_out_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$BombPlayer/Camera2D.limit_bottom=1800
		create_tween().tween_property($BombPlayer/Camera2D,"zoom",Vector2(0.6,0.6),0.7)
func _on_cam_zoom_out_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		create_tween().tween_property($BombPlayer/Camera2D,"zoom",Vector2(1,1),0.7)


func _on_bullet_wall_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"):
		area.get_parent().kill()
