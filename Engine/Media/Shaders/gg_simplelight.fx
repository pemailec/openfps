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
float4 lightDirection = {0.25, -0.5, -0.5, 1.0};    
float4 lightColour = {1.0, 1.0, 1.0, 1.0};    
float4 ambientColour = {0.22, 0.2, 0.2, 1.0};   

texture texMap <string ResourceName = "";>;
sampler2D texSample = sampler_state
{ texture = (texMap);
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
  Out.UV = In.UV;
  Out.normal = normalize(mul(In.normal, (float3x3) mW));
  return Out;
}

//-----------------
// pixel shader
//-----------------
PSOutput PS(VSOutput In, PSOutput Out)
{ 
  float4 baseColour;
  baseColour  = tex2D(texSample, In.UV);

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