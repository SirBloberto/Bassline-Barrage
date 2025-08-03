extends Node
class_name Level


signal victory


@export var popularity_requirement: int


@onready var player: Player = $Player
@onready var camera: Camera = $Camera


var popularity: int = 0:
	set(value):
		if value == popularity_requirement:
			victory.emit()
		popularity = value


func _ready() -> void:
	camera.target = player
	Global.level = self
	player.progress_bar.max_value = popularity_requirement
