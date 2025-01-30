extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_tween().tween_property($Motor1,"rotation",360,500)
	create_tween().tween_property($Motor2,"rotation",360,500)
