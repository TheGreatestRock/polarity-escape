extends Area2D

@onready var hud: CanvasLayer = $"../HUD"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if PlayerManager:
			var player_manager = PlayerManager
			player_manager.set_magnet(true)
		body.HAS_MAGNET = true
		hud.set_polarity(-1)
		hide()
		audio_stream_player_2d.play()
		


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
