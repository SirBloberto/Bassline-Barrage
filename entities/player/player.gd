extends CharacterBody2D
class_name Player


@export var move_speed: float = 100.0


const PROJECTILE: PackedScene = preload("res://entities/projectile/projectile.tscn")



func _physics_process(_delta: float) -> void:
	var input: Vector2 = Input.get_vector("a", "d", "w", "s")
	input = input.normalized()
	
	velocity = input * move_speed
	
	move_and_slide()


func _on_timer_timeout() -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	var relative_position: Vector2 = (mouse_position - global_position).normalized()
	
	var projectile = PROJECTILE.instantiate()
	projectile.global_position = global_position
	projectile.linear_velocity = relative_position * 500.0
	get_tree().root.add_child(projectile)
