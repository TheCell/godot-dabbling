shader_type canvas_item;

void vertex()
{
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0)
	{
		float speed = 5.0;
		vec2 circle = vec2(cos(TIME*speed) * 100.0, sin(TIME*speed) * 100.0);
		VERTEX += vec2(-200.0, -50.0) + circle;
	}
	
	//VERTEX += vec2(sin(TIME) * 100.0, 0.0);
	//VERTEX += vec2(cos(TIME) * 100.0, sin(TIME) * 100.0);
}

void fragment()
{
}
