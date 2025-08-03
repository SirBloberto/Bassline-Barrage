extends Projectile
class_name DefaultMusic


var period: float
var amplitude: float
var phase: float
var decceleration: float
var perpendicular_direction: Vector2


func _ready() -> void:
	super._ready()


func _physics_process(delta: float) -> void:
	phase += delta
