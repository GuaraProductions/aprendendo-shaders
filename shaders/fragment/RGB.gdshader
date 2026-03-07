shader_type canvas_item;

uniform float offset_red = 2.0;
uniform float offset_blue = 6.0;
uniform float offset_green = 13.0;

uniform float time_scale = 1.0;

float time_normalized() {
	return (TIME * time_scale);
}

void fragment() {
	COLOR = texture(TEXTURE, UV) * vec4(abs(cos((time_normalized() + 1.0) * 0.5) + offset_red),
										abs(cos((time_normalized() + 1.0) * 0.5) + offset_green),
										abs(cos((time_normalized() + 1.0) * 0.5) + offset_blue),1);
}

