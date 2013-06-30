// Shader for blending six terrain textures using two mask textures
// plus diffuse lighting using a single directional light
// Green Gandalf 7 September 2010.

float4x4 mWVP  : WorldViewProjection; 
float4x4 mW    : World;    
float4x4 WorldView : WorldView;
float4 eyePos : CameraPosition;

//-----------------
// tweaks
//-----------------
float4 lightDirection = {0.57735, -0.57735, 0.57735, 1.0};    
float4 lightColour = {1.0, 1.0, 1.0, 1.0};    
float4 ambientColour = {0.25, 0.25, 0.25, 1.0};     
float2 repeatScale = {16.0, 16.0};

texture maskMap1 <string ResourceName = "";>;
sampler2D maskSample1 = sampler_state
{ texture = (maskMap1);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = clamp;
  addressV  = clamp;
};

texture maskMap2 <string ResourceName = "";>;
sampler2D maskSample2 = sampler_state
{ texture = (maskMap2);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = clamp;
  addressV  = clamp;
};

texture detailMap1 <string ResourceName = "";>;
sampler2D detailSample1 = sampler_state
{ texture = (detailMap1);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

texture detailMap2 <string ResourceName = "";>;
sampler2D detailSample2 = sampler_state
{ texture = (detailMap2);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

texture detailMap3 <string ResourceName = "";>;
sampler2D detailSample3 = sampler_state
{ texture = (detailMap3);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

texture detailMap4 <string ResourceName = "";>;
sampler2D detailSample4 = sampler_state
{ texture = (detailMap4);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

texture detailMap5 <string ResourceName = "";>;
sampler2D detailSample5 = sampler_state
{ texture = (detailMap5);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

texture detailMap6 <string ResourceName = "";>;
sampler2D detailSample6 = sampler_state
{ texture = (detailMap6);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = wrap;
  addressV  = wrap;
};

//-----------------
// structs 
//-----------------
struct VSInput
{ float4 pos : position; 
  float2 UV  : texcoord0; 
  float3 normal : normal;
};

struct VSOutput
{ float4 pos : position; 
  float2 maskUV : texcoord0; 
  float2 UV : texcoord1;
  float3 normal : texcoord2;
};

struct PSOutput { float4 colour : color; };

//-----------------
// vertex shader
//-----------------
VSOutput VS(VSInput In, VSOutput Out)
{ Out.pos = mul(In.pos, mWVP);
  Out.maskUV = In.UV;
  Out.UV = In.UV * repeatScale;
  Out.normal = normalize(mul(In.normal, (float3x3) mW));
  return Out;
}

//-----------------
// pixel shader
//-----------------
PSOutput PS(VSOutput In, PSOutput Out)
{ float4 rgbColours1 = tex2D(maskSample1, In.maskUV);
  float4 baseColour;
  baseColour  = tex2D(detailSample1, In.UV) * rgbColours1.r;
  baseColour += tex2D(detailSample2, In.UV) * rgbColours1.g;
  baseColour += tex2D(detailSample3, In.UV) * rgbColours1.b;

  float4 diffuse = saturate(dot(normalize(In.normal), -lightDirection));
  float4 lighting = diffuse * lightColour + ambientColour;
  Out.colour = baseColour * lighting;

  return Out;
}

technique blendAndLight {
	pass p0 {		
		vertexShader = compile vs_1_1 VS(); 
		pixelShader  = compile ps_2_0 PS(); 
	}
}