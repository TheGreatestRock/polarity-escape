extends Area2D

@onready var player: CharacterBody2D = $"../Player"

@export var POLARITY: int = -1

func _physics_process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.HAS_MAGNET == true and body == player:
		#check if the player has the same polarity as the area
		if body.POLARITY == POLARITY and body.HAS_MAGNET == true:
			#decrease the polarity of the player
			body.JUMP_VELOCITY = body.JUMP_VELOCITY * 2
		elif body.POLARITY != POLARITY and body.HAS_MAGNET == true:
			#increase the polarity of the player
			body.JUMP_VELOCITY = body.JUMP_VELOCITY / 2

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.JUMP_VELOCITY = -300.0
