#version 330 core

uniform mat4 uProjectionView;

in vec3 aPosition;
in vec3 aNormal;
in mat4 aInstanceTransform;
in vec4 aInstanceColor;

out vec3 vNormal;
out vec3 vPosition;
out vec4 vColor;

void main( void ) {

  mat4 model = transpose(aInstanceTransform);
  gl_Position = uProjectionView * model * vec4(aPosition, 1.0);

  vPosition = vec3(model * vec4(aPosition, 1.0));
  vNormal   = vec3(model * vec4(aNormal, 0.0));
  vColor = aInstanceColor;
  vPosition = aPosition;
}
