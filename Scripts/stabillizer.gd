@tool
extends Area2D
var movTween

@export var sizeOut:int
@export var sizeIn:int
@export var execute_button:bool=false:
	set = _set_execute_button
	
@onready var offset_distance = sizeIn*10
@onready var rel_size = (sizeOut/2)-offset_distance
func _set_execute_button(_newVal:bool)->void:
	execute_button=false
	$Feild.scale=Vector2(sizeOut,sizeOut)
	$CollisionShape2D.scale=Vector2(sizeIn,sizeIn)

func _ready() -> void:
	if not Engine.is_editor_hint():
		_on_rand_mov_timeout()
		$Feild.scale=Vector2(sizeOut,sizeOut)
		$CollisionShape2D.scale=Vector2(sizeIn,sizeIn)

func _on_rand_mov_timeout() -> void:
	var x_pos = randi_range(-rel_size,rel_size)
	var y_pos = sqrt(((rel_size*rel_size)-(x_pos*x_pos)))
	var f_pos = Vector2(x_pos,randi_range(-y_pos,y_pos))
	movTween = create_tween().bind_node($CollisionShape2D)
	movTween.tween_property($CollisionShape2D,"position",f_pos,$randMov.wait_time)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"):
		$randMov.stop()
		$life.start()
		area.get_parent().kill() #The projectile has a kill function that displays particles and queues frees
		$ExplosionParticles.position=$CollisionShape2D.position
		$CollisionShape2D.queue_free()
		$ExplosionParticles.restart()
		$Feild.create_tween().tween_property($Feild,"self_modulate",Color(0,0,0,0),$life.wait_time)
		TransitonScreen.transition()

func _on_life_timeout() -> void:
	#await TransitonScreen.on_transition_finished
	get_tree().reload_current_scene()
	queue_free()
