extends CharacterBody2D


const SPEED = 130.0
const RUNNING_SPEED = 260.0

var JUMP_VELOCITY = -300.0
var HAS_MAGNET = true
var POLARITY = -1 # 1 for positive, -1 for negative


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("change_polarity"):
		switch_polarity()
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#also check shift for running
	var direction := Input.get_axis("ui_left", "ui_right")
	var running := Input.is_action_pressed("ui_shift")
	if direction:
		if running:
			velocity.x = direction * RUNNING_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)



	move_and_slide()
	
func switch_polarity():
	POLARITY *= -1
	print(POLARITY)

func get_polarity() -> int:
	return POLARITY

func has_magnet() -> bool:
	return HAS_MAGNET
	
func set_jump_velocity(value: float) -> void:
	JUMP_VELOCITY = value
