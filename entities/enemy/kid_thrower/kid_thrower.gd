extends Enemy
class_name KidThrower


@onready var timer: Timer = $Timer

var is_throwing: bool = true
var direction_to_player: Vector2 = Vector2.ZERO


func _ready() -> void:
	sprite.play()
	var randomized_offset: float = randf() * 3.0
	var start_timer = get_tree().create_timer(randomized_offset)
	await start_timer.timeout
	timer.start(timer.wait_time + (randf() - 0.5) * 2.0)


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if not can_see:
		return
	var difference: Vector2 = (player.position - position).normalized()
	direction_to_player = Vector2(difference.x, 0) if abs(difference.x) > abs(difference.y) else Vector2(0, difference.y)


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


func _on_can_see_changed() -> void:
	if is_throwing:
		return
	if can_see:
		timer.start()
	else:
		timer.stop()
