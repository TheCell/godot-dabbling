shader_type canvas_item;

vec3 my_function(int a, float b)
{
	return vec3(1.0, 2.0, 3.0);
}

float add_floats(float a, float b)
{
	float result = a + b;
	return result;
}

int subtract_int(int a, int b)
{
	int result = a - b;
	return result;
}

void vertex()
{
	vec3 return_value = my_function(1, 2.0);
	float sum_of_floats = add_floats(3.5, 4.2);
	int result = subtract_int(5, 2);
}

void fragment()
{
}
