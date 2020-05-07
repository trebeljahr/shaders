#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 colorA = vec3(0.0353, 0.0941, 0.5529);
vec3 colorB = vec3(0.9608, 0.8431, 0.3137);

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0.0);

  vec3 pct = vec3(st.x);

  pct.r = smoothstep(1.0, 0.0, sin(u_time / 2.0) + st.y - 1.0);
  pct.g = smoothstep(1.0, 0.0, sin(u_time / 2.0) + st.y);
  pct.b = smoothstep(1.0, 0.0, sin(u_time / 2.0) + st.y);

  color = mix(colorA, colorB, pct);

  gl_FragColor = vec4(color, 1.0);
}