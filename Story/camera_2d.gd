extends Camera2D

var randomStrength:= 30.0
var shakeFade:=5.0
var rng = RandomNumberGenerator.new()
var shake_strength:=0.0

func apply_shake():
	shake_strength=randomStrength
func  randomOffset()->Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength)+400,rng.randf_range(-shake_strength,shake_strength)+225)
func _process(delta: float) -> void:
	if shake_strength>0:
		shake_strength=lerpf(shake_strength,0,shakeFade*delta)
		offset=randomOffset()
