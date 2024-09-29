extends Area2D

@export var destination: Vector2 = Vector2(1892, 1) # Position de destination de la téléportation
@onready var player: CharacterBody2D = $"../Player"


var joueur_proche = null  # Référence au joueur si celui-ci est proche de la porte

# Détecte l'entrée du joueur dans la zone de la porte


# Vérifie si le joueur appuie sur la touche d'interaction pour se téléporter
func _process(delta):
	if joueur_proche and Input.is_action_just_pressed("ui_up"):
		joueur_proche.global_position = destination  # Téléporte le joueur à la destination
		if PlayerManager:
			PlayerManager.set_base_pos(destination)
		get_tree().reload_current_scene()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		joueur_proche = player # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		joueur_proche = null
