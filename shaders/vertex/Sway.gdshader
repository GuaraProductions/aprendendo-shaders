shader_type canvas_item;

uniform float sway_value = 100.0;
uniform float anchor = 0.0;

void vertex() {
	
	vec2 final_vector = VERTEX;

	float distortion = sin(TIME) * sway_value;
	
	if (VERTEX.g < anchor) {
		final_vector += vec2(distortion,0);
	}

	VERTEX = final_vector;
}