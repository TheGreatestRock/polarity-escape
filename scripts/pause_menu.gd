extends Control

func _ready() -> void:
	hide()
	get_tree().paused = false

#when ui_cancel pressed
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		show()
		get_tree().paused = true
		
func _on_continue_pressed() -> void:
	hide()
	get_tree().paused = false


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
