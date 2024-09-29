extends Area2D

@onready var player: CharacterBody2D = $"../Player"

@export var POLARITY: int = -1

var player_in_area: bool = false

func _physics_process(delta: float) -> void:
	if player_in_area == true:
		update_jump_velocity(player)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.HAS_MAGNET == true and body == player:
		player_in_area = true
		update_jump_velocity(body)

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_area = false
		body.JUMP_VELOCITY = -300.0

func update_jump_velocity(body: CharacterBody2D) -> void:
	if body.POLARITY == POLARITY and body.HAS_MAGNET == true:
		body.JUMP_VELOCITY = -600
	elif body.POLARITY != POLARITY and body.HAS_MAGNET == true:
		body.JUMP_VELOCITY = -150
