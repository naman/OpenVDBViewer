/*
  Copyright (C) 2014 Callum James

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/// @file normalVertex.glsl
/// @brief Vertex shader for the normal shader
/// @author Callum James
/// @version 1.0
/// @date 12/02/2014
/// Revision History:
/// Initial Version 05/01/2014

#version 400 core

/// @brief Model View Projection Matrix
uniform mat4 MVP;

layout (location=0)in vec3 inVert;
layout (location=1)in vec2 inUV;
layout (location=2)in vec3 inNormal;

out vec2 UV;
out vec3 normal;
// id of whether or not to draw due to LOD
flat out int b_draw;
// value of s
uniform float u_s;

void calculate()
{
    float m_s = u_s; // get value of s
    int id = int(inUV.x); // vertex number stored in UV.x
    if (mod(id,m_s) == 0.0) // if the modulus of the two is 0 then we cna draw this point
    {
        gl_Position = MVP*vec4(inVert,1.0);

        UV = inUV;
        normal = inNormal;
        b_draw = 1; //  this will be drawn
    }
    else
    {
        b_draw = 0;
    }
}

void main()
{
    calculate();
}
