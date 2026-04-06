shader_type spatial;
render_mode blend_mix, diffuse_toon, specular_toon, depth_draw_opaque;

uniform sampler2D object_texture;
uniform sampler2D color_gradient;
uniform sampler2D fresnel_gradient;

float fresnel(float amount, vec3 normal, vec3 view) {
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0 )), amount);
}

void fragment() {
	float fresnel_value = fresnel(3.5, NORMAL, VIEW);
	
	vec4 object_texture_color = texture(object_texture, UV);

	ALBEDO = object_texture_color.rgb + (fresnel_value * texture(fresnel_gradient, vec2(fresnel_value, 0.0)).rgb * 1.0);

}

void light() {
	float clamp_value = clamp(dot(NORMAL,LIGHT), -0.9, 0.9);
	float sample = clamp((clamp_value + 1.0) * ATTENUATION / 2.1, 0.05, 0.95);
	vec4 shaded_material = texture(color_gradient, vec2(sample, 0));
	
	DIFFUSE_LIGHT += clamp((shaded_material.rgb * LIGHT_COLOR), 0.12, 0.88);
}
