extends Area2D
class_name PlayerProjectile


var velocity: Vector2


func _on_body_entered(body: Node) -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	position += velocity * delta
