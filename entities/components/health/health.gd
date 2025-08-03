extends Node
class_name Health


signal damaged
signal died


@export var health: int:
	set(value):
		health = value
		if health <= 0:
			died.emit()
		else:
			damaged.emit()
