#version 330

in vec4 vertex_color;

uniform float time;

out vec4 frag_color;

void main() {
    vec4 tint = vec4(sin(10.0 * time), sin(10.0 * time + 1.0), sin(10.0 * time + 2.0), 1.0);
    tint = 0.5 * tint + 0.5;
    frag_color = vertex_color; // * tint;
}