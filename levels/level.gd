extends Node
class_name Level


signal victory


@export var popularity_requirement: int


var popularity: int = 0:
	set(value):
		if value == popularity_requirement:
			victory.emit()
		popularity = value
