extends Node
class_name Level


signal victory


@export var popularity_requirement: int
@export var new_scene: String = ""



@onready var player: Player = $Player
@onready var camera: Camera = $Camera
@onready var disk_spawn: Node2D = $DiskSpawn


const DISK = preload("res://entities/disk/disk.tscn")


var popularity: int = 0:
	set(value):
		if value == popularity_requirement:
			victory.emit()
		popularity = value


func _ready() -> void:
	camera.target = player
	Global.level = self
	player.progress_bar.max_value = popularity_requirement
	
	var type = Global.tracks.pick_random()
	var disk = DISK.instantiate()
	disk.track = type
	add_child(disk)
	disk.global_position = disk_spawn.global_position
	victory.connect(_on_victory)
	
	if new_scene == "":
		await get_tree().create_timer(2.0).timeout
		player.hud.victory.show()


func _on_victory() -> void:
	get_tree().change_scene_to_file(new_scene)
