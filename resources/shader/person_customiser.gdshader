shader_type canvas_item;

uniform float colour_tolerance = 0.01;
uniform float outline_relative_brightness = 0.7;

uniform vec3 skin_colour: source_color;
uniform vec3 shirt_colour: source_color;
uniform vec3 pants_colour: source_color;

group_uniforms SPRITE_DEFAULTS;
uniform vec3 skin_base: source_color = vec3(0.996, 0.804, 0.455);
uniform vec3 skin_outline: source_color = vec3(0.933, 0.486, 0.341);
uniform vec3 shirt_base: source_color = vec3(0.655, 0.945, 0.443);
uniform vec3 shirt_outline: source_color = vec3(0.224, 0.714, 0.392);
uniform vec3 pants_base: source_color = vec3(0.447, 0.937, 0.965);
uniform vec3 pants_outline: source_color = vec3(0.231, 0.365, 0.788);

void fragment() {
	vec3 colour = COLOR.rgb;
	
	if (distance(COLOR.rgb, skin_outline) < colour_tolerance)
		colour.rgb = skin_colour * outline_relative_brightness;
	if (distance(COLOR.rgb, skin_base) < colour_tolerance)
		colour.rgb = skin_colour;
	
	if (distance(COLOR.rgb, shirt_base) < colour_tolerance)
		colour.rgb = shirt_colour;
	if (distance(COLOR.rgb, shirt_outline) < colour_tolerance)
		colour.rgb = shirt_colour * outline_relative_brightness;
		
	if (distance(COLOR.rgb, pants_base) < colour_tolerance)
		colour.rgb = pants_colour;
	if (distance(COLOR.rgb, pants_outline) < colour_tolerance)
		colour.rgb = pants_colour * outline_relative_brightness;
	
	COLOR.rgb = colour;
}
