extends Node


var settings: Settings
var player_customization: PlayerCustomization
var player_beat: PlayerBeat = PlayerBeat.new()
var player: Player
var level: Level

const TRACKS_DIRECTORY = "res://common/tracks/"
var tracks: Array = []


func _ready() -> void:
	if not ResourceLoader.exists(Settings.SETTINGS_PATH):
		Settings.new().save()
	settings = ResourceLoader.load(Settings.SETTINGS_PATH)
	
	for track in DirAccess.get_files_at(TRACKS_DIRECTORY):
		tracks.append(load(TRACKS_DIRECTORY + track.split(".")[0].to_lower() + ".tres"))
