extends RigidBody2D

var size = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in range(2):
		$CollisionShape2D.scale[n] = size
		$MeshInstance2D.scale[n]=size*20
		#print(str($MeshInstance2D.scale[n])+' '+str($CollisionShape2D.scale[n]))
	print($MeshInstance2D.modulate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left","ui_right")
	input.y = Input.get_axis("ui_up",'ui_down')
	apply_central_force(input*delta*10000)
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		for n in range(3):
			$MeshInstance2D.modulate[n]=randf_range(0,1)
