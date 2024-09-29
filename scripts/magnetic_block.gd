extends RigidBody2D

@export var POLARITY: int = -1
@export var force_strength: float = 10.0 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"


# Called when the node is added to the scene.
func _ready() -> void:
	_update_animation()


# Runs every physics frame.
func _physics_process(delta: float) -> void:
	if player and player.HAS_MAGNET:
		apply_force_based_on_polarity()


# Update animation based on polarity
func _update_animation() -> void:
	animated_sprite_2d.animation = "Positive" if POLARITY == 1 else "Negative"


# Called when another body enters the area.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or body is RigidBody2D:
		set_collision_layer(3)


# Called when another body exits the area.
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D or body is RigidBody2D:
		set_collision_layer(2)


# Applies force based on polarity difference between this and the player.
func apply_force_based_on_polarity() -> void:
	
	var direction: Vector2 = (player.global_position - global_position).normalized()
	
	# Reverse direction if the polarities are the same.
	if POLARITY == player.POLARITY:
		direction = -direction

	# Apply force to the rigid body.
	apply_central_impulse(direction * force_strength)
