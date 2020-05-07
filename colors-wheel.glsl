#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform float u_time;

vec3 hsb2rgb(in vec3 c) {
  vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0,
                   0.0, 1.0);
  rgb = rgb * rgb * (3.0 - 2.0 * rgb);
  return c.z * mix(vec3(1.0), rgb, c.y);
}

float circle(in vec2 _st, in float _radius) {
  vec2 dist = _st - vec2(0.5);
  return 1. - smoothstep(_radius - (_radius * 0.01), _radius + (_radius * 0.01),
                         dot(dist, dist) * 4.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec2 toCenter = vec2(0.5) - st;
  float angle = atan(toCenter.y, toCenter.x);
  float radius = length(toCenter) * 2.0;
  float x = angle / TWO_PI + u_time / 10.0;
  vec3 someColor = hsb2rgb(vec3(x - 0.575, radius, 1.0));
  vec3 color = vec3(someColor);
  gl_FragColor = vec4(color, circle(st, 0.9));
}