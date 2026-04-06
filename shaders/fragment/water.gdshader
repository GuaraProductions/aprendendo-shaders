shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_enable, filter_nearest;

uniform sampler2D wave : repeat_enable;
uniform sampler2D distortion_wave : repeat_enable;
uniform vec4 shallow_color : source_color = vec4(1.0);
uniform vec4 deep_color : source_color = vec4(1.0);
uniform vec4 cor_base : source_color = vec4(1.0);

void fragment() {

	float ruido_distorcao = texture(distortion_wave, UV).r;
	
	vec2 uv_distorcida = UV + ruido_distorcao;
	
	float onda = texture(wave, UV).a * 0.1;
	
	vec4 cor_da_agua = mix(shallow_color, deep_color, onda);
	
	vec2 backGroundUV = SCREEN_UV * uv_distorcida;
	backGroundUV.x += onda;
	backGroundUV.y += onda;
	
	COLOR= mix(texture(SCREEN_TEXTURE, backGroundUV), cor_da_agua, 0.2) ;
}