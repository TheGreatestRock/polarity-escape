extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var HAS_MAGNET = true
var POLARITY = -1 # 1 for positive, -1 for negative


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func switch_polarity():
	POLARITY *= -1





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("groups"):
		print("ye")
		body.collision_layer = 1
		body.collision_layer = 1
	else:
		print("non")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("groups"):
		print("yes")
		body.collision_layer = 3
		body.collision_layer = 3
	else:
		print("no")
