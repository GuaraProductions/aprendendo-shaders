shader_type canvas_item;

uniform sampler2D wave : repeat_enable;
uniform sampler2D distortion_wave : repeat_enable;
uniform vec4 shallow_color : source_color = vec4(1.0);
uniform vec4 deep_color : source_color = vec4(1.0);
uniform vec4 cor_base : source_color = vec4(1.0);

void fragment() {

	float ruido_distorcao = texture(distortion_wave, UV).r;
	
	vec2 uv_distorcida = UV + ruido_distorcao;
	
	float onda = texture(wave, uv_distorcida + vec2(sin(TIME * 0.02),sin(TIME * 1.6)* 0.05)).r;
	
	vec3 cor_da_agua = mix(shallow_color.rgb, deep_color.rgb, onda);
	
	float textura_do_ruido_com_distorcao = texture(wave, UV ).r;
	COLOR.rgb = cor_da_agua ;
}