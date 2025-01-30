extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=Vector2(1277,112)
	global_rotation=0
	var tween = create_tween().bind_node(self)
	tween.tween_property(self,"position",Vector2(1287,632),6)
	tween.tween_property(self,"rotation_degrees",90,1)
	tween.parallel().tween_property(self,"position",Vector2(975,636),2)
	tween.tween_property(self,"rotation_degrees",125,1)
	tween.parallel().tween_property(self,"position",Vector2(445,335),4)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"):
		var tween = create_tween().bind_node(self)
		$CPUParticles2D.emitting=true
		tween.tween_property(self,"self_modulate",Color(0,0,0,0),0.3)
		tween.parallel().tween_property(self,"scale",Vector2(1.6,1.6),0.3)
		tween.tween_callback(self.queue_free).set_delay(0.4)
func kill()->void:
	#Some evil laugh as the alien eats it
	pass
