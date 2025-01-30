extends Area2D
@export var nextLvl:String

func _ready() -> void:
	$OrbitalParticles.emitting=true
	$OrbitalParticles.preprocess=true
	var tween := create_tween().bind_node(self)
	tween.tween_property($Sprite2D,"rotation",-360,1000)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		TransitonScreen.transition()
		await TransitonScreen.on_transition_finished
		get_tree().change_scene_to_file("res://levels/level_"+str(nextLvl)+".tscn")
