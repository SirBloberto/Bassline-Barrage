extends Node2D
class_name Enemy


signal can_see_changed


@export var player: Player
@export var view_distance: float


var can_see: bool = false:
	set(value):
		if can_see != value:
			can_see = value
			can_see_changed.emit()


func _physics_process(_delta: float) -> void:
	can_see = (position - player.position).length() < view_distance


func _on_health_damaged() -> void:
	pass # Flash white


func _on_health_died() -> void:
	pass # Increase popularity.  Give a thumbs up
