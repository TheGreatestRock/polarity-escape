extends RigidBody2D


@export var POLARITY: int = -1
var force_strength: float = 10.0 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"


# Called when the node is added to the scene.
func _ready():
	# Initialize if necessary.
	if POLARITY == 1:
		animated_sprite_2d.animation = "Positive"
	else:
		animated_sprite_2d.animation = "Negative"
		
		

# Runs every physics frame.
func _physics_process(delta: float) -> void:
	apply_force_based_on_polarity(player)



func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, collision_layer, collision_mask)
	collision_layer = 3

func _on_area_2d_body_exited(body: Node2D) -> void:
	print(body, collision_layer, collision_mask)
	collision_layer = 2


# Function to apply force based on polarity
func apply_force_based_on_polarity(body: Node2D) -> void:
	var direction = (body.global_position - global_position).normalized()
	var force = direction * POLARITY * force_strength
	apply_central_impulse(force)
