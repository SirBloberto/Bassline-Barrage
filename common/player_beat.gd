extends Resource
class_name PlayerBeat


@export var track1: Track:
	set(value):
		track1 = value
		for index in range(len(value.tracks)):
			add_audio_stream(value.tracks[index], 1, index)
		add_audio_stream(load("res://resources/audio/track1/record1.ogg"), 1, 2)
@export var track2: Track:
	set(value):
		track2 = value
		for index in range(len(value.tracks)):
			add_audio_stream(value.tracks[index], 2, index)
		add_audio_stream(load("res://resources/audio/track1/record2.ogg"), 1, 2)
@export var track3: Track:
	set(value):
		track3 = value
		for index in range(len(value.tracks)):
			add_audio_stream(value.tracks[index], 3, index)

var track_index: int = 1
var current_playback: int = 1


var tracks: Dictionary = {}#[int, Array[AudioStream]]


func add_audio_stream(stream: AudioStream, offset: int, index: int) -> void:
	var audio_stream = AudioStreamPlayer.new()
	audio_stream.stream = stream
	Global.add_child(audio_stream)
	if index == 0:
		audio_stream.finished.connect(audio_stream_finished, offset)
		track_index += 1
	if offset == 1:
		audio_stream.play()
	if not tracks.has(offset):
		tracks[offset] = []
	tracks[offset].append(audio_stream)
	current_playback


func audio_stream_finished() -> void:
	current_playback = track_index
	if current_playback >= track_index:
		current_playback = 1
	for track in tracks[current_playback]:
		track.play()
