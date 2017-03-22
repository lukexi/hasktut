#version 330 core

in vec3 vNormal;
in vec3 vPosition;
in vec2 vUV;
in vec4 vColor;

out vec4 color;


const   vec3 lightColor = vec3(1);
const   vec3 lightPosition = vec3(0,0,1);
const   float ambient = 0.2;

void main(void) {

    vec3 normal = normalize(vNormal);

    vec3 surfaceToLight = normalize(lightPosition - vPosition);

    float diffuseCoefficient = max(ambient, dot(normal, surfaceToLight));
    vec3 diffuseLit = diffuseCoefficient * vColor.rgb * lightColor;

    color = vec4(diffuseLit, vColor.a);


    // color = vColor;
}
