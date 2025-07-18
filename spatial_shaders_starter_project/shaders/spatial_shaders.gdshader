shader_type spatial;

uniform sampler2D my_texture;
uniform vec3 sphere_color: source_color = vec3(1.0);

void fragment()
{
	vec2 adjusted_uv = UV * 4.0;
	adjusted_uv.y += sin(adjusted_uv.x * 50.0 + TIME * 10.0) * 0.025;
	
	vec4 texture_color = texture(my_texture, adjusted_uv);
	ALBEDO = texture_color.rgb;
	ALPHA = 1.0;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
