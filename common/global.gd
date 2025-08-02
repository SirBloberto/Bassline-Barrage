extends Node


var settings: Settings


func _ready() -> void:
	if not ResourceLoader.exists(Settings.SETTINGS_PATH):
		Settings.new().save()
	settings = ResourceLoader.load(Settings.SETTINGS_PATH)
