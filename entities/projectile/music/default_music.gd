extends Projectile
class_name DefaultMusic


var period: float
var amplitude: float
var phase: float
var decceleration: float
var perpendicular_direction: Vector2
var t = 0.5
var p = 400.0


func _ready() -> void:
	super._ready()


func _physics_process(delta: float) -> void:
	phase += delta
	var perpendicular = Vector2(direction.y, -direction.x)
	global_position += (t * direction + p * perpendicular * sin(phase)) * speed * delta
