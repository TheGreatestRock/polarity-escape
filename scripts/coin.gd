extends Area2D

@onready var hud: CanvasLayer = $"../HUD"

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if PlayerManager:
			var player_manager = PlayerManager
			player_manager.set_magnet(true)
		body.HAS_MAGNET = true
		hud.set_polarity(-1)
		queue_free()
