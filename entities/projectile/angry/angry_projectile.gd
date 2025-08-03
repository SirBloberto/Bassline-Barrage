extends Projectile
class_name AngryProjectile


var offsets: Array[Vector2] = [
	Vector2(0, 16),
	Vector2(0, 32),
	Vector2(32, 16)
]


func _ready() -> void:
	var random_offset: Vector2 = offsets.pick_random()
	sprite.region_rect = Rect2(random_offset.x, random_offset.y, 16, 16)
	super._ready()
