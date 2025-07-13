shader_type canvas_item;

const int my_int = -10;

void vertex()
{
	// Called for every vertex the material is visible on.	
	
	float my_float = 2.5;
	my_float = 10.23;
	
	bool my_bool = false;
	my_bool = true;
	
	vec2 my_vec2 = vec2(6.0, 5.0);
	vec4 my_vector = vec4(vec2(1.0, 2.0), my_vec2);
	my_vec2 = vec2(1.0);
	
	my_vector.x; my_vector.r; my_vector.s;
	my_vector.y; my_vector.g; my_vector.t;
	my_vector.z; my_vector.b; my_vector.p;
	my_vector.w; my_vector.a; my_vector.q;
	
	ivec2 my_ivec2 = ivec2(2);
	bvec2 my_bvec2 = bvec2(true, false);
	
	vec3 v3 = vec3(my_vector.x, my_vector.y, my_vector.z);
	v3.xy = my_vector.wz;
}

void fragment()
{
	// Called for every pixel the material is visible on.
}
