extends ColourCustomizer
class_name ConcertAttendee


var tween: Tween


const MAX_HEIGHT: float = 8

var current_value: float = randf() * 3.0
var jump_period: float = 0.14 * randf() + 0.14
var base_position: Vector2


func _ready() -> void:
	base_position = position
	super._ready()


func _physics_process(delta: float) -> void:
	position.y = base_position.y + clamp(sin(current_value / jump_period) * MAX_HEIGHT, -MAX_HEIGHT, MAX_HEIGHT / 2.0)
	current_value += delta
