#version 330

#define PI 3.141592653589793238462643383279502884197169399375105820

uniform mat4 view_mx;
uniform mat4 projection_mx

in vec2 v_geoCoords;
in float v_width;
in int v_color;

out float width;
flat out int color;

void main()
{
	// Pass width and color

	float lat_sin = sin( (PI/180.0) * v_geoCoords.y);
	float lon_sin = sin( (PI/180.0) * v_geoCoords.x);
	
	float lat_cos = cos( (PI/180.0) * v_geoCoords.y);
	float lon_cos = cos( (PI/180.0) * v_geoCoords.x);
	
	float r = 1.0; //6378137.0;
	
	vec3 world_position = vec3( lon_sin * lat_cos * r,
								lat_sin * r,
								lat_cos * lon_cos * r );
								
	gl_Position = projection_matrix * view_mx * vec4(world_position,1.0);
}