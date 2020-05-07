#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 hsb2rgb(in vec3 c) {
  vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0,
                   0.0, 1.0);
  rgb = rgb * rgb * (3.0 - 2.0 * rgb);
  return c.z * mix(vec3(1.0), rgb, c.y);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec2 pos = vec2(0.5) - st;

  float r = length(pos) * 2.0;
  float a = atan(pos.y, pos.x);

  float f = abs(cos(a * 12.) * sin(a * 3.)) * .8 + .1;
  f = f + sin(u_time);
  f = f / 2.0;

  vec2 toCenter = vec2(0.5) - st;
  float radius = length(toCenter) * 2.0;
  float x = f * 10. / TWO_PI;
  vec3 someColor = hsb2rgb(vec3(x - 0.575, radius, 1.0));
  vec3 color = vec3(someColor - smoothstep(f, f + 0.02, r));

  gl_FragColor = vec4(color, 1.0);
}