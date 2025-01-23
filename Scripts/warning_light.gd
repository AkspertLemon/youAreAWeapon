extends PointLight2D

var timer:float
var spawnPos:Vector2
var spawnRot:float
var zdex:int
func _ready() -> void:
	enabled = true
	energy=0
	z_index=zdex
	global_position=spawnPos
	global_rotation=spawnRot
	$warnTimer.start(timer)
	create_tween().bind_node(self).tween_property($".","energy",20,timer)


func _on_warn_timer_timeout() -> void:
	queue_free()
