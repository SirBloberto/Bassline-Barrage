extends AnimatedSprite2D
class_name ColourCustomizer


@export var skin_colours: Array[Color]
@export var shirt_colours: Array[Color]
@export var pant_colours: Array[Color]


func _ready() -> void:
	var skin_colour: Color = skin_colours.pick_random()
	var shirt_colour: Color = shirt_colours.pick_random()
	var pant_colour: Color = pant_colours.pick_random()
	#material = ShaderMaterial.new()
	#material.shader = load("res://resources/shader/person_customiser.gdshader")
	set_instance_shader_parameter("skin_colour", skin_colour)
	set_instance_shader_parameter("shirt_colour", shirt_colour)
	set_instance_shader_parameter("pant_colour", pant_colour)
