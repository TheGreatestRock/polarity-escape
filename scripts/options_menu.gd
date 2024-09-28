extends Control

var is_fullscreen
var volume
@onready var h_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer/HSlider
@onready var check_box: CheckBox = $MarginContainer/VBoxContainer/Fullscreen/CheckBox


func _ready() -> void:
	#get the current values of the options
	is_fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) / 80.0 + 1.0
	check_box.set_pressed(is_fullscreen)
	h_slider.value = volume

func _on_button_pressed() -> void:
	#back so we don't save the options
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	check_box.set_pressed(is_fullscreen)
	if volume:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80.0 + 80.0 * volume)
	h_slider.value = volume
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_save_pressed() -> void:
	#save the options
	print("Options saved")
	#change the scene
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print("Fullscreen enabled")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		print("Fullscreen disabled")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_h_slider_value_changed(value: float) -> void:
	print("Volume changed to: ", value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80.0 + 80.0 * value)
