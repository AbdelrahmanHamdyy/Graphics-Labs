#iChannel0 "pickle_cat.png"
#iChannel1 "pickle_cat_heightmap.jpg"

vec2 cycle(float theta) {
    return vec2(cos(theta), sin(theta));
}

void main() {
    // vec4 --> 4 component vector
    // Runs for every pixel on the screen (All at the same time)
    // if (gl_FragCoord.x > iResolution.x * 0.5 + 10.0 * sin(gl_FragCoord.y * 0.1 + iTime * 2.0))
    // if (distance(gl_FragCoord.xy, iResolution.xy * 0.5) < 100.0)
    //     gl_FragColor = vec4(1.0, 0.5, 0.0, 1.0);
    // else
    //     gl_FragColor = vec4(0.0, 0.5, 1.0, 1.0);
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    float depth = texture(iChannel1, uv).r;
    gl_FragColor = texture(iChannel0, uv + depth * 0.02 * cycle(iTime));
    gl_FragColor.rgb *= gl_FragColor.a;

}