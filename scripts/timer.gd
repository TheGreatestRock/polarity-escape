extends Control

var time_elapsed: float = 0.0  # Store elapsed time
@onready var timer_label: Label = $TimerLabel

func _ready() -> void:
	if PlayerManager:
		var player_manager = PlayerManager
		time_elapsed = player_manager.get_elapsed_time()


# Called every frame. Updates the timer label.
func _process(delta: float) -> void:
	# Update the timer
	time_elapsed += delta
	if PlayerManager:
		var player_manager = PlayerManager
		player_manager.set_elapsed_time(time_elapsed)
	
	# Format the time (minutes:seconds.milliseconds)
	var minutes = int(time_elapsed) / 60
	var seconds = int(time_elapsed) % 60
	var milliseconds = int((time_elapsed) * 100) % 100
	
	# Update the label with formatted timev
	if timer_label:
		timer_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

func get_time() -> float:
	return time_elapsed

func reset_timer() -> void:
	time_elapsed = 0.0
	
func hide_timer() -> void:
	timer_label.hide()

func show_timer() -> void:
	timer_label.show()
	
