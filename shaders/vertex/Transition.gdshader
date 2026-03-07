shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0, 0.01);
uniform float divisions : hint_range(2.0,36.0,1.0);

void fragment() {
	vec2 uv = fract(UV * divisions);
	
	vec2 uv_center = abs(uv - 0.5);
	
	float distance_center = uv_center.x + uv_center.y;
	
	float strength = distance_center * UV.x;
	
	if (strength < progress) {
		COLOR.a = 1.0 * COLOR.a;
	} else {
		COLOR.a = 0.0 * COLOR.a;
	}
}