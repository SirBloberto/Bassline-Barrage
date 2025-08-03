extends Camera2D
class_name Camera


@export var min_camera: Vector2
@export var max_camera: Vector2
@export var target: Node2D

var view_distance_x: float = 80
var view_distance_y: float = 72


func _physics_process(_delta: float) -> void:
	if target == null:
		return
	
	position.x = clamp(target.position.x, min_camera.x + view_distance_x, max_camera.x - view_distance_x)
	position.y = clamp(target.position.y, min_camera.y + view_distance_y, max_camera.y - view_distance_y)
	
