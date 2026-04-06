shader_type spatial;

void vertex() {
	float amplitude = 1.;
	float frequency = 1.;
	VERTEX.y = amplitude * sin(VERTEX.x * frequency);
}

void fragment() {
	// Called for every pixel the material is visible on.
}