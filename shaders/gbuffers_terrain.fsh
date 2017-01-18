#version 450 compatibility
#define gbuffers_basic
#define fsh
#define ShaderStage -1
#include "/lib/Syntax.glsl"
#include "/lib/Utility.glsl"

/* DRAWBUFFERS:01 */

layout (location = 0) out vec4 albedo;
layout (location = 1) out vec4 normal;

uniform sampler2D texture;
uniform sampler2D normals;

in vec2 texcoord;
in vec4 color;

in mat3 tbnMatrix;

vec3 getNormalMapping(vec2 coord) {
    vec3 normal =  texture2D3(normals, coord);
    normal.xyz = tbnMatrix * normalize(normal.xyz * 2.0 - 1.0);

    return normal;
}

void main() {
    vec4 colorSample = texture2D(texture, texcoord) * color;
    vec3 normalSample = getNormalMapping(texcoord);


    albedo = vec4(sRGB2L(colorSample.rgb), colorSample.a);
    normal = vec4(normalSample, 1.0);
}