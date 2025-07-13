shader_type canvas_item;

group_uniforms FirstGroup;
uniform float my_float: hint_range(1.0, 10.0) = 5.0;

group_uniforms FirstGroup.SubGroup;
uniform int my_int: hint_range(0, 100, 5);
group_uniforms;

group_uniforms SecondGroup;
uniform bool my_bool;
uniform vec4 my_color: source_color;
group_uniforms;

void vertex()
{
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0)
	{
		float speed = my_float;
		vec2 circle = vec2(cos(TIME*speed) * 100.0, sin(TIME*speed) * 100.0);
		VERTEX += vec2(-200.0, -50.0) + circle;
	}
	
	//VERTEX += vec2(sin(TIME) * 100.0, 0.0);
	//VERTEX += vec2(cos(TIME) * 100.0, sin(TIME) * 100.0);
}

void fragment()
{
	vec4 output_color = vec4(1.0, 0.5, 1.0, 1.0);
	
	vec4 color1 = vec4(1.0, 0.0, 0.0, 1.0);
	vec4 color2 = vec4(0.0, 1.0, 0.0, 1.0);
	
	float mix_pct = (sin(TIME * 3.0) + 1.0) * 0.5;
	vec4 mixed_color = mix(color1, my_color, mix_pct);
	
	vec4 texture_color = texture(TEXTURE, UV);
	
	//vec4 blend = mix(output_color, texture_color, mix_pct);
	//COLOR = blend;
	
	COLOR = texture_color * mixed_color;
	
	//COLOR = vec4(UV.x, UV.y, 0.0, 1.0);
}

	