#version 450 compatibility
#define composite4
#define fsh
#define ShaderStage 4
#include "/lib/Syntax.glsl"

/*
Whoop whoop, compile camera aperature iso and exposure.
finalize image with dof
*/

uniform sampler2D colortex0;

in vec2 texcoord;

layout (location = 0) out vec4 albedo;

#include "/lib/Debug.glsl"

void main() {
    albedo = texture(colortex0, texcoord);

    exit();
}