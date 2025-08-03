extends Node
class_name Health


signal damaged
signal died


@export var health: int:
	set(value):
		health = value
		if health <= 0:
			died.emit()
			is_alive = false
		else:
			damaged.emit()

var is_alive: bool = true
