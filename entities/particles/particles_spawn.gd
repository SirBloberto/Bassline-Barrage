extends Node2D
class_name ParticlesSpawn


@export var particle_frequency: float


@onready var particles: Array = $Particles.get_children()
@onready var spawns: Array = $Spawns.get_children()
@onready var timer: Timer = $Timer


func _ready() -> void:
	await get_tree().create_timer(randf()).timeout
	timer.wait_time = 1.0 / particle_frequency
	timer.start()


func _on_timer_timeout() -> void:
	var random_particle = particles.pick_random()
	random_particle.show()
	var random_start = spawns.pick_random()
	var tween: Tween = get_tree().create_tween()
	tween.finished.connect(tween_finished)
	tween.tween_method(func(value): random_particle.global_position = value, random_start.global_position, random_start.global_position - Vector2(0.0, 4.0), 1.5)


func tween_finished() -> void:
	timer.start()
	for particle in particles:
		particle.hide()
