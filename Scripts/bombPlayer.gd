extends RigidBody2D

@onready var main = get_tree().get_root().get_node("level_1")
@onready var projectile = load("res://Scenes/tri_projectile.tscn")
var size = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MeshInstance2D.modulate = Color.DARK_TURQUOISE
	for n in range(2):
		$CollisionShape2D.scale[n] = size
		$MeshInstance2D.scale[n]=size*20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Vector2.ZERO
	var spin = 0
	input.x = Input.get_axis("move_a","move_d")
	input.y = Input.get_axis("move_w",'move_s')
	spin = Input.get_axis("rot_q","rot_e")
	apply_central_force(input*delta*10000)
	apply_torque(spin*2000)
	if  not $Clock_ticker.playing && not $Explode_snd.playing:$Clock_ticker.play(0)
	
	
func _on_bomb_timer_timeout() -> void:
	var tween := create_tween().bind_node(self).set_trans(Tween.TRANS_QUART)
	tween.tween_property($MeshInstance2D, "modulate", Color.CRIMSON, 1.8)
	$Timer.start()
	
	
@export var projec_num = 100
func explode() -> void:
	$Clock_ticker.stop()
	$Explode_snd.play(0)
	var rot_offset = 2*PI/projec_num
	for n in range(projec_num):
		var instance = projectile.instantiate()
		instance.dir = rotation+((n-1)*rot_offset)
		instance.spawnPos = global_position
		instance.spawnRot = rotation+((n-1)*rot_offset)
		instance.zdex = z_index-1
		main.add_child.call_deferred(instance)
	$MeshInstance2D.modulate=Color.DARK_TURQUOISE


func explode_timeout() -> void:
	explode()
