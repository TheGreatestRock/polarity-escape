# Block.gd
extends RigidBody2D

# Block polarity (1 for positive, -1 for negative)
var block_polarity: int = 1

# Reference to the player node
var player: Node2D = null

# Called when the node enters the scene tree for the first time
func _ready():
	# Find the player node (adjust the path as necessary for your scene)
	player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:

	if player == null:
		return

	var player_position = player.global_position
	var block_position = global_position

	var direction = (player_position - block_position).normalized()
	
	#only apply the force from left or right
	if abs(direction.x) > abs(direction.y):
		direction.y = 0
	else:
		direction.x = 0
	
	var force = direction * 100 * block_polarity
	
	apply_central_impulse(force)
	
	# Ensure that the physics body doesn't go to sleep
	set_sleeping(false)


func switch_polarity():
	block_polarity *= -1
	var anim_sprite = $AnimatedSprite
	
	if block_polarity == 1:
		anim_sprite.play("positive")
	else:
		anim_sprite.play("negative")
	
