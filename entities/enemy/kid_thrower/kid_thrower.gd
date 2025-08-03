extends Enemy
class_name KidThrower


@onready var timer: Timer = $Timer

var is_throwing: bool = true
var direction_to_player: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.UP


const ANGRY_PROJECTILE = preload("res://entities/projectile/angry/angry_projectile.tscn")


func _ready() -> void:
	sprite.play()
	var randomized_offset: float = randf() * 3.0
	var start_timer = get_tree().create_timer(randomized_offset)
	await start_timer.timeout
	timer.wait_time = (timer.wait_time + (randf() - 0.5) * 2.0)


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if not can_see:
		return
	var difference: Vector2 = (player.position - position).normalized()
	direction_to_player = Vector2(difference.x, 0) if abs(difference.x) > abs(difference.y) else Vector2(0, difference.y)


func _process(_delta: float) -> void:
	if not get_node("Health").is_alive:
		sprite.animation = "idle_down" #Dancing?
		return
	if velocity.length() == 0 and not is_throwing:
		if direction_to_player.y < 0 and direction_to_player.x == 0:
			sprite.animation = "idle_up"
		if direction_to_player.y > 0 and direction_to_player.x == 0:
			sprite.animation = "idle_down"
		if direction_to_player.x != 0 and direction_to_player.y == 0:
			sprite.animation = "idle_side"
			sprite.flip_h = direction_to_player.x < 0
	elif velocity.y < 0 and velocity.x == 0:
		sprite.animation = "walk_up"
		last_direction = Vector2(0.0, velocity.y)
	elif velocity.y > 0 and velocity.x == 0:
		sprite.animation = "walk_down"
		last_direction = Vector2(0.0, velocity.y)
	elif velocity.x != 0 and velocity.y == 0:
		sprite.animation = "walk_side"
		sprite.flip_h = velocity.x < 0
		last_direction = Vector2(velocity.x, 0.0)


func _on_timer_timeout() -> void:
	if not get_node("Health").is_alive:
		return
	if direction_to_player.y < 0 and direction_to_player.x == 0:
		sprite.animation = "throw_up"
	elif direction_to_player.y > 0 and direction_to_player.x == 0:
		sprite.animation = "throw_down"
	elif direction_to_player.x != 0 and direction_to_player.y == 0:
		sprite.animation = "throw_side"
		sprite.flip_h = direction_to_player.x < 0
	sprite.play()
	is_throwing = true


#Randomize what they throw.  Water bottle that does 1, Tomato that does 2 and tomato that explodes for 1
func _on_sprite_animation_looped() -> void:
	if not is_throwing:
		return
	sprite.animation = "idle_up"
	timer.start(timer.wait_time + (randf() - 0.5) * 2.0)
	var angry_projectile = ANGRY_PROJECTILE.instantiate()
	angry_projectile.direction = (player.global_position - global_position).normalized()
	angry_projectile.damage = 1
	angry_projectile.global_position = global_position
	get_tree().root.add_child(angry_projectile)
	is_throwing = false


func _on_can_see_changed() -> void:
	if is_throwing:
		return
	if can_see:
		timer.start()
	else:
		timer.stop()
