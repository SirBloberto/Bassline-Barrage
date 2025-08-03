extends Control
class_name MainMenu


@onready var settings_menu: SettingsMenu = $SettingsMenu


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/classroom.tscn")


func _on_settings_button_pressed() -> void:
	settings_menu.show()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
