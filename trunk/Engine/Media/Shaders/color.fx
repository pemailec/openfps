//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//                    Green Gandalf's Tutorial Shaders
//
//  These shaders are all designed for use in DBPro and have been tested in
//  FX Composer and EffectEdit with an NVIDIA GeForce FX 5200 128MB Graphics card.
//
//                    Chapter 1 - Basic Functionality
//                       Example 1 - Simply Red
//
// Description
//   This is a basic shader which displays an object on the screen and
//   colours it red without any lighting shading. The colour can be changed
//   from within DBPro by changing the value of the vector constant "lightColour".
//
// Created: 29 October 2006.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// The following lines are variables which are recognised and passed by the 
// application and often referred to as "untweaks".

matrix wvp : WorldViewProjection;

// The following lines are variables which can be set by the application
// (these are usually variables which the user may want to adjust from
// their program).

float4 lightColour = {0.0, 0.0, 1.0, 1.0}; // {red, green, blue, alpha}

// The following lines define structures that are used as input and output
// to the vertex and pixel shader functions.

struct VSInput { float4 Pos  : Position; };

struct VSOutput { float4 Pos : Position; };

// The pixel shader does not need an input structure for this example.

struct PSOutput { float4 Col : Color; };

// The vertex shader code:

VSOutput VShader (VSInput In, VSOutput Out)
{  // Transforms the objects model coordinates to
   // screen space coordinates
   Out.Pos = mul(In.Pos, wvp);
   return Out;
};

// The pixel shader code:

PSOutput PShader (PSOutput Out)
{  // Just outputs the chosen colour without additional processing.
   Out.Col = lightColour;
   return Out;
};

// The following lines just put this together as a single technique
// with a single pass.

technique simplyOneColour
{  pass p1
   {  VertexShader = compile vs_1_1 VShader();
      PixelShader  = compile  ps_1_1 PShader();
   }
}

// Comments:
//   1. There is no real need for the vertex shader in this example
//      since the calculated output position is the default behaviour
//      anyway. The main use of the vertex shader is to change the
//      default behaviour and to precalculate variables for the pixel
//      shader stage - neither needed in this example. See effect file
//      "simply red no vertex shader.fx" for the code.
//   2. Note the use of // for comments.
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


