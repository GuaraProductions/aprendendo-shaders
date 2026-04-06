shader_type spatial; 

uniform float sway_value = 1.0;
uniform sampler2D noise : repeat_enable;
uniform vec4 color : source_color = vec4(1.0);

void vertex() {
	
	vec4 textura = texture(noise, UV);
	
	VERTEX.y += smoothstep(0.12 , 0.43, pow(textura.y,5));
}

void fragment() {
	ALBEDO = mix(texture(noise, UV), color, 0.2).rgb;
}