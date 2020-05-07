#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 colorA = vec3(0.149, 0.141, 0.912);
vec3 colorB = vec3(1.000, 0.833, 0.224);

float plot(vec2 st, float pct) {
  return smoothstep(pct - 0.01, pct, st.y) - smoothstep(pct, pct + 0.01, st.y);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0.0);

  vec3 pct = vec3(st.x);

  pct.r = pow(st.y, 0.9);
  pct.g = pow(st.x, 0.9);
  pct.b = pow(st.y, 0.9);

  color = mix(colorA, colorB, pct);

  gl_FragColor = vec4(color, 1.0);
}