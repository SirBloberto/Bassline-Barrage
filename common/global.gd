extends Node


var settings: Settings
var player_customization: PlayerCustomization
var player_beat: PlayerBeat

#Previous player beat and track.  We should save this if we win


func _ready() -> void:
	if not ResourceLoader.exists(Settings.SETTINGS_PATH):
		Settings.new().save()
	settings = ResourceLoader.load(Settings.SETTINGS_PATH)
