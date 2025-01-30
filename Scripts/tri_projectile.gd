extends CharacterBody2D
var SPEED = 750
var dir:float
var spawnPos:Vector2
var spawnRot:float
var zdex:int
func _ready() -> void:
	z_index=zdex+2
	global_position=spawnPos
	global_rotation=spawnRot
	
func _physics_process(_delta: float) -> void:
	velocity=Vector2(0,-SPEED).rotated(dir)
	move_and_slide()
func _on_life_timeout() -> void:
	kill()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"): 
		kill()

func kill():
	queue_free()
	#$explosion.emitting=true
	#$Sprite2D.modulate(Color.TRANSPARENT)
	#$Grace.start()
func _on_grace_timeout() -> void:
	queue_free()
