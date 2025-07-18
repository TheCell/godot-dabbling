shader_type canvas_item;

uniform sampler2D mask_texture;

void vertex() {
}

void fragment() {
	vec4 mask_color = texture(mask_texture, UV);
	vec4 original_color = texture(TEXTURE, UV);
	vec4 final_color = original_color;
	
	if (mask_color.r >= 0.0)
	{
		final_color.a = mask_color.r;
	}
	
	COLOR = final_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
