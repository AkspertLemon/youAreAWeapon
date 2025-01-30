extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=Vector2(1277,112)
	global_rotation=0
	var tween = create_tween().bind_node(self)
	tween.tween_property(self,"position",Vector2(1287,632),6)
	tween.tween_property(self,"rotation_degrees",87,1)
	tween.tween_property(self,"position",Vector2(922,670),2)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"):
		print("I died!")
		$CPUParticles2D.emitting=true
		
		#create_tweem
		create_tween().bind_node(self).tween_callback(self.queue_free)
