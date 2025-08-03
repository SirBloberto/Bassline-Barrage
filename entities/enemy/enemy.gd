extends Node2D
class_name Enemy


signal can_see_changed


@export var player: Player
@export var view_distance: float


@onready var sprite: AnimatedSprite2D = $Sprite
@onready var particles_upset: ParticlesSpawn = $ParticlesUpset
@onready var particles_happy: ParticlesSpawn = $ParticlesHappy
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var convert_effect: AudioStreamPlayer = $ConvertSoundEffect

var white_amount: float = 0.0


var can_see: bool = false:
	set(value):
		if can_see != value:
			can_see = value
			can_see_changed.emit()


func _physics_process(delta: float) -> void:
	can_see = (position - player.position).length() < view_distance
	white_amount -= max(delta * 2.0, 0.0)
	sprite.material.set_shader_parameter("white_amount", white_amount)


func _on_health_damaged() -> void:
	white_amount = 1.0


func _on_health_died() -> void:
	particles_happy.show()
	particles_upset.hide()
	Global.player.progress_bar.value += 1
	collision_shape.set_deferred("disabled", true)
	convert_effect.play()
