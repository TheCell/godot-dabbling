shader_type canvas_item;

uniform sampler2D noise_tex;
uniform float dissolve_pct: hint_range(0.0, 1.0) = 0.3f;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	vec4 final_color = original_color;
	vec4 noise = texture(noise_tex, UV);
	
	if (dissolve_pct >= noise.r)
	{
		final_color.a = 0.0;
	}
	
	COLOR = final_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
