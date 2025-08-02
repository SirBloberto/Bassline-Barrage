extends Area2D
class_name Projectile


var velocity: Vector2
var friendly: bool = false
var damage: int = 1


const WALL_LAYER: int = 1
const FRIENDLY_LAYER: int = 2
const ENEMY_LAYER: int = 4


func _ready() -> void:
	if friendly:
		collision_layer = 1 << FRIENDLY_LAYER
		collision_mask |= 1 << (ENEMY_LAYER - 1)
	else:
		collision_layer = 1 << ENEMY_LAYER
		collision_mask |= 1 << (FRIENDLY_LAYER - 1)


func _on_body_entered(body: Node) -> void:
	if body.has_node("Health"):
		body.get_node("Health").health -= damage
	queue_free()


func _physics_process(delta: float) -> void:
	position += velocity * delta
