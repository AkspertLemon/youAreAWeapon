extends Area2D
@export var next_scn:String

func _ready() -> void:
	$OrbitalParticles.emitting=true
	$OrbitalParticles.preprocess=true
	var tween := create_tween().bind_node(self)
	tween.tween_property($Sprite2D,"rotation",-360,1000)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(next_scn)
		print("Collided")
