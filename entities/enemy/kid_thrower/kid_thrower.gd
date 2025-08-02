extends Enemy
class_name KidThrower


@onready var timer: Timer = $Timer
@onready var sprite: AnimatedSprite2D = $Sprite

var is_throwing: bool = true


func _ready() -> void:
	sprite.play()
	var randomized_offset: float = randf() * 3.0
	var start_timer = get_tree().create_timer(randomized_offset)
	await start_timer.timeout
	timer.start(timer.wait_time + (randf() - 0.5) * 2.0)


func _on_timer_timeout() -> void:
	sprite.animation = "throw_up"
	is_throwing = true


#Randomize what they throw.  Water bottle that does 1, Tomato that does 2 and tomato that explodes for 1
func _on_sprite_animation_looped() -> void:
	if not is_throwing:
		return
	sprite.animation = "idle_up"
	timer.start(timer.wait_time + (randf() - 0.5) * 2.0)
	is_throwing = false
