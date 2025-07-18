shader_type spatial;

uniform sampler2D normalmap_tex: repeat_enable, filter_linear;
uniform sampler2D normalmap_tex2: repeat_enable, filter_linear;
uniform vec3 albedo: source_color = vec3(1.0);
uniform vec2 direction1 = vec2(1.0, 0.0);
uniform vec2 direction2 = vec2(1.0, 0.0);

uniform float scroll_speed1: hint_range(0.0, 1.0) = 0.03;
uniform float scroll_speed2: hint_range(0.5, 0.8) = 0.03;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 offset1 = direction1 * scroll_speed1 * TIME;
	vec2 offset2 = direction2 * scroll_speed2 * TIME;
	vec3 normal = texture(normalmap_tex, UV + offset1).rgb;
	vec3 normal2 = texture(normalmap_tex2, UV + offset2).rgb;
	
	NORMAL_MAP = mix(normal, normal2, 0.5);;
	
	ALBEDO = albedo;
	METALLIC = 0.0;
	ROUGHNESS = 0.01;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
