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
float4 ambientColour = {0.42, 0.4, 0.4, 1.0};   
float2 repeatScale1 = {16.0, 16.0};
float2 repeatScale2 = {4.0, 4.0};
float2 repeatScale3= {16.0, 16.0};

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

texture shadowMap <string ResourceName = "";>;
sampler2D shadowSample = sampler_state
{ texture = (shadowMap);
  minFilter = linear;
  magFilter = linear;
  mipFilter = linear;
  addressU  = clamp;
  addressV  = clamp;
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
  float3 wNormal : texcoord3;
  float4 wPos : texcoord4;
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
  float4 wPos = mul( In.pos, mW );
  float3 wNormal = mul( In.normal, (float3x3)mW );
  Out.wNormal = normalize(wNormal);
  Out.wPos = wPos;

  return Out;
}

//-----------------
// pixel shader
//-----------------
PSOutput PS(VSOutput In, PSOutput Out)
{ float4 rgbColours1 = tex2D(maskSample1, In.maskUV);
  float4 ShadowColor = tex2D(shadowSample, In.maskUV);
  float4 baseColour;
  baseColour  = tex2D(detailSample1, In.UV* repeatScale1) * rgbColours1.r;
  baseColour += tex2D(detailSample2, In.UV* repeatScale2) * rgbColours1.g;
  baseColour += tex2D(detailSample3, In.UV* repeatScale3) * rgbColours1.b;

  //adding some rim lighting - reverse fresnel
  float3 viewDir = normalize(eyePos - In.wPos);
  float angle = saturate( dot( In.wNormal, viewDir ) );
  angle = smoothstep( 0.3, 0.8, angle );
  float4 RimColor = lerp( float4( 0.8,0.8,0.8,0), float4(0.2,0.2,0.2,0), angle );

  float4 diffuse = saturate(dot(normalize(In.normal), -lightDirection));
  float4 lighting = diffuse * lightColour + ambientColour;
  float4 color = baseColour * lighting;

  Out.colour = color;

  return Out;
}

technique blendAndLight {
	pass p0 {		
		vertexShader = compile vs_1_1 VS(); 
		pixelShader  = compile ps_2_0 PS(); 
	}
}