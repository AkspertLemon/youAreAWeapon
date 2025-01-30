extends CanvasLayer

signal on_transition_finished
func _ready() -> void:
	$ColorRect.visible=false
	$AnimationPlayer.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		$AnimationPlayer.play("fade_in")
	elif anim_name=="fade_in":
		$ColorRect.visible=false

func transition():
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_to_black")
