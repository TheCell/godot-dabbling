shader_type canvas_item;

uniform sampler2D gradient_texture;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	float grayscale = (original_color.r + original_color.g + original_color.b) / 3.0;
	
	vec2 sample_coords = vec2(grayscale);
	vec4 gradient_color = texture(gradient_texture, sample_coords);
	
	COLOR = vec4(grayscale, grayscale, grayscale, original_color.a);
	COLOR = vec4(gradient_color.r, gradient_color.g, gradient_color.b, original_color.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
