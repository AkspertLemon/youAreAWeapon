extends CharacterBody2D
var SPEED = 600
var dir:float
var spawnPos:Vector2
var spawnRot:float
var zdex:int
func _ready() -> void:
	z_index=zdex
	global_position=spawnPos
	global_rotation=spawnRot
	#$Sprite2D.rotation=spawnRot
	
func _physics_process(_delta: float) -> void:
	velocity=Vector2(0,-SPEED).rotated(dir)
	move_and_slide()


func _on_life_timeout() -> void:
	queue_free()
