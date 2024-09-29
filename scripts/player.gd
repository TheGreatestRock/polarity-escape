extends CharacterBody2D


const SPEED = 130.0
const RUNNING_SPEED = 260.0

var JUMP_VELOCITY = -300.0
var HAS_MAGNET = false
var POLARITY = 0 # 1 for positive, -1 for negative

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var hud: CanvasLayer = $"../HUD"

@onready var camera_2d: Camera2D = $Camera2D
@onready var timer: Timer = $Camera2D/Timer

func _ready() -> void:
	animated_sprite_2d.speed_scale = 1.0
	# check the playermanager to keep track of multiple things even after reloading the scene
	hud.set_polarity(POLARITY)
	if PlayerManager:
		var player_manager = PlayerManager
		HAS_MAGNET = player_manager.get_magnet()
		POLARITY = player_manager.get_polarity()
		print(POLARITY)
		JUMP_VELOCITY = player_manager.get_jump_velocity()
		position = player_manager.get_base_pos()
	if Music:
		Music.play()

func _physics_process(delta: float) -> void:
	
	if Engine.time_scale != 0.5:
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
			if direction < 0:
				#set the animation to walk then flip the sprite
				animated_sprite_2d.animation = "walk"
				animated_sprite_2d.flip_h = true
			else:
				animated_sprite_2d.animation = "walk"
				animated_sprite_2d.flip_h = false

			if running:
				animated_sprite_2d.speed_scale = 2.0
				velocity.x = direction * RUNNING_SPEED
			else:
				animated_sprite_2d.speed_scale = 1.0
				velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite_2d.animation = "idle"
			
		move_and_slide()
	
	else:
		animated_sprite_2d.animation = "death"
	
func switch_polarity():
	if HAS_MAGNET:
		if POLARITY == 0:
			POLARITY = -1
		POLARITY *= -1
		hud.set_polarity(POLARITY)
		if PlayerManager:
			var player_manager = PlayerManager
			player_manager.set_polarity(POLARITY)

		print(POLARITY)

func get_polarity() -> int:
	return POLARITY

func has_magnet() -> bool:
	return HAS_MAGNET
	
func set_jump_velocity(value: float) -> void:
	JUMP_VELOCITY = value
