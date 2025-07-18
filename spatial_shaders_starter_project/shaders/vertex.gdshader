shader_type spatial;

void vertex() {
	//VERTEX += vec3(cos(TIME * 2.0), sin(TIME * 2.0), 0.0);
	//VERTEX *= (sin(TIME * 10.0) + 1.0) * 0.5 + 1.0;
	VERTEX.x += sin(TIME*10.0 + VERTEX.y * 10.0) * 0.02;
}

