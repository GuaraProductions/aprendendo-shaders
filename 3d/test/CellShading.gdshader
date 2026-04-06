shader_type spatial;
render_mode diffuse_toon, specular_toon;

uniform sampler2D texture_albedo : filter_linear_mipmap, repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
}

void light() {

}
