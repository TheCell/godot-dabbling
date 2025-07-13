shader_type canvas_item;

void vertex()
{
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0)
	{
		//VERTEX += vec2(-200.0 + TIME, 0.0);
	}
	
	VERTEX += vec2(TIME, 0.0);
}

void fragment()
{
}
