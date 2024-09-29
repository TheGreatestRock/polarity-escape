extends Node2D

@onready var objets_dimension = get_tree().get_nodes_in_group("dimension")
@onready var objets_reality = get_tree().get_nodes_in_group("reality")
@onready var tilemap = get_node("TileMap")
var in_dimension = false
@onready var player: CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	# Le joueur commence dans la dimension 1 (collisions avec couche 1)
	 # Le joueur interagit avec les objets de la couche 1

	
	tilemap.modulate = Color(1, 1, 1, 1)  # Réinitialiser la couleur
	
	# Rendre les objets de la couche 1 visibles et activer leur collision
	cacher_et_ajuster_collision(objets_dimension)
	afficher_et_ajuster_collision(objets_reality)
	# Assurez-vous que le shader est réinitialisé
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change_dimension"):
		toggle_dimension()

func toggle_dimension():
	if !in_dimension:
		# Passer à la dimension 2
		in_dimension = true

		# Le joueur interagit maintenant avec la couche 2
		tilemap.modulate = Color(1, 0.5, 0.7, 1)  # Appliquer une teinte rouge à la TileMap

		# Activer la collision avec les objets de la couche 2 et désactiver la collision de la couche 1
		afficher_et_ajuster_collision(objets_dimension)
		cacher_et_ajuster_collision(objets_reality)
		# Appliquer un filtre rouge via le shader pour signaler la dimension 2
		#shader.set_shader_param("color_filter", Color(1, 0.5, 0.5, 1))  # Filtre rouge
	else:
		# Revenir à la dimension 1
		in_dimension = false

		# Le joueur interagit maintenant avec la couche 1
		tilemap.modulate = Color(1, 1, 1, 1)  # Réinitialiser la couleur
		# Activer la collision avec les objets de la couche 1 et désactiver la collision de la couche 2
		cacher_et_ajuster_collision(objets_dimension)
		afficher_et_ajuster_collision(objets_reality)
		# Réinitialiser le filtre du shader pour revenir à la dimension 1
		#shader.set_shader_param("color_filter", Color(1, 1, 1, 1))  # Pas de filtre

func afficher_et_ajuster_collision(groupe):
	for obj in groupe:
		obj.visible = true
		obj.collision_layer = 1  # Assigner la bonne couche de collision pour les objets
		obj.collision_mask = 2 | 3    # Les objets peuvent interagir avec les couches 1 et 2

func cacher_et_ajuster_collision(groupe):
	for obj in groupe:
		obj.visible = false
		obj.collision_layer = 0  # Désactiver la collision pour les objets cachés
