extends Node2D
class_name ColourCustomizer


@export var skin_colours: Array[Color] = [
	Color("#fecd74"),
	Color("#5b3716"),
	Color("#b3810c")
]
@export var shirt_colours: Array[Color] = [
	Color("#a7f171"),
	Color("#b13e53"),
	Color("#39b664"),
	Color("#247079"),
	Color("#95B0C3"),
	Color("#576D86")
]
@export var pants_colours: Array[Color] = [
	Color("#72eff6"),
	Color("#29376E"),
	Color("#3B5DC9"),
	Color("#41A6F6")
]
@export var player_customization: PlayerCustomization:
	set(value):
		player_customization = value
		if player_customization == null:
			return
		skin_colour = player_customization.skin_colour
		shirt_colour = player_customization.shirt_colour
		pants_colour = player_customization.pants_colour
		if not is_node_ready():
			await ready
		set_material_parameters()


var skin_colour: Color = skin_colours.pick_random()
var shirt_colour: Color = shirt_colours.pick_random()
var pants_colour: Color = pants_colours.pick_random()


func _ready() -> void:
	set_material_parameters()


func set_material_parameters() -> void:
	material.set_shader_parameter("skin_colour", skin_colour)
	material.set_shader_parameter("shirt_colour", shirt_colour)
	material.set_shader_parameter("pants_colour", pants_colour)
