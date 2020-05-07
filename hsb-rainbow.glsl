#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 hsb2rgb(in vec3 c) {
  vec3 rgb = clamp(abs(mod(c.x * 5.1 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0,
                   0.0, 1.0);
  rgb = rgb * rgb * (4.0 - rgb);
  return mix(vec3(1.0), rgb, 1.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  vec3 color = hsb2rgb(vec3(st.x, 1.0, 1));

  gl_FragColor = vec4(color, 1.0);
}