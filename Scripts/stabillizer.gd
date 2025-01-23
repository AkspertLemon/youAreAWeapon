extends Area2D
@onready var offset_distance = $CollisionShape2D.scale[0]*10
@onready var rel_size = ($Feild.scale[0]/2)-offset_distance
var movTween
func _ready() -> void:
	_on_rand_mov_timeout()

func _on_rand_mov_timeout() -> void:
	var x_pos = randi_range(-rel_size,rel_size)
	var y_pos = sqrt(((rel_size*rel_size)-(x_pos*x_pos)))
	var f_pos = Vector2(x_pos,randi_range(-y_pos,y_pos))
	movTween = create_tween().bind_node($CollisionShape2D)
	movTween.tween_property($CollisionShape2D,"position",f_pos,$randMov.wait_time)

func _on_area_entered(area: Area2D) -> void:
	$randMov.stop()
	$life.start()
	area.get_parent().queue_free()
	$ExplosionParticles.position=$CollisionShape2D.position
	$CollisionShape2D.queue_free()
	$ExplosionParticles.restart()
	$Feild.create_tween().tween_property($Feild,"self_modulate",Color(0,0,0,0),$life.wait_time)


func _on_life_timeout() -> void:
	queue_free()
