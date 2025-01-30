extends Node2D
var flag=true
func button_pressed()->void:
	if flag:
		flag=false
		$LevelButton/ButtonClr.modulate = Color(77, 179, 80,1)
		$LevelButton/ButtonClr.position[1] -= 5
		$button_cooldown.start()
		self.create_tween().tween_property($Arms,"rotation",$Arms.rotation-PI/2,2)



func _on_level_button_body_entered(body: Node2D) -> void:
	button_pressed()
func _on_level_button_area_entered(area: Area2D) -> void:
	button_pressed()


func _on_button_cooldown_timeout() -> void:
	flag=true
	$LevelButton/ButtonClr.modulate = Color(171, 52, 40,1)
	$LevelButton/ButtonClr.position[1] += 5
