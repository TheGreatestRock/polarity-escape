extends Node

# Declare variables you want to track
var BASE_POS: Vector2 = Vector2(-854, -12)
var HAS_MAGNET: bool = false#
var JUMP_VELOCITY: float = -300.0
var POLARITY: int = 0
var ELAPSED_TIME: float = 0.0


func _physics_process(delta: float) -> void:
	print("Base Pos: ", BASE_POS, " Has Magnet: ", HAS_MAGNET, " Jump Velocity: ", JUMP_VELOCITY, " Polarity: ", POLARITY, " Elapsed Time: ", ELAPSED_TIME)

func set_polarity(polarity: int) -> void:
	print(polarity, POLARITY)
	POLARITY = polarity
	

func get_polarity() -> int:
	return POLARITY

func get_jump_velocity() -> float:
	return JUMP_VELOCITY

func get_elapsed_time() -> float:
	return ELAPSED_TIME

func set_elapsed_time(time: float) -> void:
	ELAPSED_TIME = time

func reset_elapsed_time() -> void:
	ELAPSED_TIME = 0.0

func set_magnet(has_magnet: bool) -> void:
	print(HAS_MAGNET, has_magnet)
	HAS_MAGNET = has_magnet

func get_magnet() -> bool:
	return HAS_MAGNET

func set_base_pos(pos: Vector2) -> void:
	BASE_POS = pos

func get_base_pos() -> Vector2:
	return BASE_POS
