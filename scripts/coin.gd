extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.HAS_MAGNET = true
		queue_free()
