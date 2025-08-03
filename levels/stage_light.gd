extends PointLight2D
class_name StageLight

@export var phase: float


@export var speed: float = 2.0
@export var scaleX: float = 2.0
@export var scaleY: float = 2.0


var velocity: Vector2


func _physics_process(delta: float) -> void:
	phase += speed * delta
	
	if phase > PI * 2.0:
		phase -= PI * 2.0
	
	velocity.x = cos(phase) * scaleX
	velocity.y = (pow(cos(phase), 2) - pow(sin(phase), 2)) * scaleY
	
	position += velocity
