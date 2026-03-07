shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D noise : repeat_enable;
uniform vec4 color : source_color = vec4(1.0);

void fragment() {
	vec2 ruido_uv_y = UV;
	ruido_uv_y.y -= TIME * 0.1;
	
	float distorcao_pixels_no_x = texture(noise, UV + vec2(0,TIME * 0.5)).r ;
	float inversao_y = 1.0 - UV.y;
	
	vec2 uv_distorcida = UV + vec2((distorcao_pixels_no_x - 0.5) , ruido_uv_y.y );
	
	float mask = step(inversao_y, distorcao_pixels_no_x);
	
	COLOR = texture(noise, uv_distorcida) * color * COLOR.a * mask;
}

