shader_type canvas_item;

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	
	float grayscale = (original_color.r + original_color.g + original_color.b) / 3.0;
	
	COLOR = vec4(grayscale, grayscale, grayscale, original_color.a);
	//COLOR = original_color * vec4(0.2, 0.2, 0.2, 1.0);
}
