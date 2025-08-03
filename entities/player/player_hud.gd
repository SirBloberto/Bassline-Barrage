extends CanvasLayer
class_name PlayerHUD


@onready var victory: Control = $Victory
@onready var defeat: Control = $Defeat
@onready var pause: Control = $Pause
@onready var settings_menu: Control = $SettingsMenu
@onready var progress_bar: ProgressBar = $ProgressBar


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("escape"):
		pause.visible = not pause.visible
		get_tree().paused = pause.visible


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu/main_menu.tscn")


func _on_resume_pressed() -> void:
	pause.visible = false
	get_tree().paused = false


func _on_settings_pressed() -> void:
	settings_menu.show()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_health_died() -> void:
	defeat.show()
	get_tree().paused = true


func _on_progress_bar_value_changed(value: float) -> void:
	if value >= progress_bar.max_value:
		Global.level.victory.emit()
