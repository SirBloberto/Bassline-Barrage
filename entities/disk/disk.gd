extends Area2D
class_name Disk


@export var track: Track:
	set(value):
		track = value
		if not is_node_ready():
			await ready
		sprite.texture = track.icon


@onready var sprite: Sprite2D = $Sprite2D


func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	var index: int = Global.player_beat.track_index
	Global.player_beat.set("track" + str(index), track)
	Global.player.set("track" + str(index) + "/texture", track.icon)
	queue_free()
