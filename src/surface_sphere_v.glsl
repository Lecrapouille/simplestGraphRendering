#version 130

uniform mat4 view_matrix;
uniform mat4 projection_matrix;

in vec3 v_position;

void main()
{
    gl_Position = projection_matrix * view_matrix * vec4(v_position,1.0);
}