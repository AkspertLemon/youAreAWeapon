extends Area2D
func _ready() -> void:
	$OrbitalParticles.preprocess=true
	var tween := create_tween().bind_node(self)
	tween.tween_property($Sprite2D,"rotation",-360,1000)
