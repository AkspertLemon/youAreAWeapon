extends AnimatedSprite2D

func _on_circuit_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectiles"):
		animation = "Red"
		$CircuitArea.queue_free()
