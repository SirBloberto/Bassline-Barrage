extends CharacterBody2D
class_name Player


@export var move_speed: float = 100.0


const PROJECTILE: PackedScene = preload("res://entities/projectile/projectile.tscn")


@onready var sprite: AnimatedSprite2D = $Sprite

var input: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.UP


func _ready() -> void:
	sprite.play()
	
	if Global.player_customization == null:
		Global.player_customization = PlayerCustomization.new()
		Global.player_customization.skin_colour = sprite.skin_colour
		Global.player_customization.shirt_colour = sprite.shirt_colour
		Global.player_customization.pants_colour = sprite.pants_colour
	else:
		sprite.player_customization = Global.player_customization


func _process(_delta: float) -> void:
	if input.length() == 0:
		if last_direction.y < 0 and last_direction.x == 0:
			sprite.animation = "idle_up"
		if last_direction.y > 0 and last_direction.x == 0:
			sprite.animation = "idle_down"
		if last_direction.x != 0 and last_direction.y == 0:
			sprite.animation = "idle_side"
			sprite.flip_h = last_direction.x < 0
	if input.y < 0 and input.x == 0:
		sprite.animation = "walk_up"
		last_direction = Vector2(0.0, input.y)
	elif input.y > 0 and input.x == 0:
		sprite.animation = "walk_down"
		last_direction = Vector2(0.0, input.y)
	elif input.x != 0 and input.y == 0:
		sprite.animation = "walk_side"
		sprite.flip_h = input.x < 0
		last_direction = Vector2(input.x, 0.0)


func _physics_process(_delta: float) -> void:
	input = Input.get_vector("a", "d", "w", "s").normalized()
	
	velocity = input * move_speed
	
	move_and_slide()


func _on_timer_timeout() -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	var relative_position: Vector2 = (mouse_position - global_position).normalized()
	
	var projectile = PROJECTILE.instantiate()
	projectile.global_position = global_position
	projectile.velocity = relative_position * 100.0
	projectile.friendly = true
	projectile.damage = 1
	get_tree().root.add_child(projectile)
