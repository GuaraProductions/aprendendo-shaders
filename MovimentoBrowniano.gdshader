shader_type canvas_item;

uniform float amplitude = 0.2;
uniform float frequencia = 3.0;

float random(vec2 uv) {
    return fract(sin(dot(uv.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

float noise(float x) {
    float i = floor(x);  // Ponto inteiro atual
    float f = fract(x);  // Distância até o próximo ponto

    // Matemática mágica para criar a "curva" suave (Smoothstep nativo)
    float u = f * f * (3.0 - 2.0 * f);

    // Pega um valor aleatório para a "ponta" da onda da esquerda e da direita, e liga os pontos!
    return mix(random(vec2(i, 0.0)), random(vec2(i + 1.0, 0.0)), u);
}

void fragment() {
	
	float x = UV.x;
	float y = sin(x * frequencia);
	
	float t = 0.01*(TIME*130.0);
	
	y += 85.5;
	
	const int octaves = 2;
	float lacunarity = 2.0;
	float gain = 0.5;
	
	float p_frequencia = frequencia;
	float p_amplitude = amplitude;
	
	for (int i = 0 ; i< octaves; i++) {
		y += p_amplitude * (noise(frequencia*x) - 0.5);
		p_frequencia *= lacunarity;
		p_amplitude *= gain;
	}
	
	y *= p_amplitude*0.06;
	
	// Desenhar a reta no ColorRect
	float espessura = 0.01;
	float linha = step(abs(UV.y - y), espessura);
	COLOR = vec4(vec3(linha), 1.0);
}