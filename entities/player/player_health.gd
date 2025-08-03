extends HBoxContainer
class_name PlayerHealth


const PLAYER_HEALTH = preload("res://entities/player/player_health.tscn")


@onready var health: Health = $"../../Health"


func _ready() -> void:
	for i in range(health.health):
		var player_health = PLAYER_HEALTH.instantiate()
		add_child(player_health)


func _on_health_damaged() -> void:
	var count: int = get_child_count()
	if count <= 0:
		return
	get_child(count - 1).queue_free()
