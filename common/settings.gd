extends Resource
class_name Settings


@export var volume: float


const SETTINGS_PATH: String = "user://settings.tres"


func save() -> void:
	ResourceSaver.save(self, SETTINGS_PATH)
