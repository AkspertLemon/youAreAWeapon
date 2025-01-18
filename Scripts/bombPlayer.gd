extends RigidBody2D

@onready var main = get_tree().get_root().get_node("main")
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
	input.x = Input.get_axis("move_a","move_d")
	input.y = Input.get_axis("move_w",'move_s')
	apply_central_force(input*delta*10000)
	
	
func _on_bomb_timer_timeout() -> void:
	var tween := create_tween().bind_node(self).set_trans(Tween.TRANS_QUART).set_parallel(false)
	tween.tween_property($MeshInstance2D, "modulate", Color.CRIMSON, 2)
	tween.tween_property($MeshInstance2D, "modulate", Color.DARK_TURQUOISE, 0)
	
	
func explode() -> void:
	for n in range(4):
		var instance = projectile.instantiate()
		instance.dir = rotation+(PI*(n-1)*0.5)
		instance.spawnPos = global_position
		instance.spawnRot = rotation+(PI*(n-1)*0.5)
		main.add_child.call_deferred(instance)


func explode_timeout() -> void:
	explode()
