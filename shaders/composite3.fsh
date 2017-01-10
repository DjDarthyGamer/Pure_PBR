#version 450 compatibility
#define composite3
#define fsh
#define ShaderStage 3
#include "/lib/Syntax.glsl"

/*
filtering pass - Reflections, CLOUDS
generation of bloom and aperature shape
*/

uniform sampler2D colortex0;

in vec2 texcoord;

layout (location = 0) out vec3 albedo;

void main() {
    albedo = texture(colortex0, texcoord).rgb;
}