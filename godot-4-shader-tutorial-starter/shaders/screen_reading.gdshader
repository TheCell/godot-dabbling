shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	float grayscale = (screen_color.r + screen_color.g + screen_color.b) / 3.0;
	COLOR = vec4(vec3(grayscale), screen_color.a);
}

