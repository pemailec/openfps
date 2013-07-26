// Breaking waves shader.
// Created 8 August 2009.

float4x4 wvp : WorldViewProjection;
float seconds : Time;

float seaLevel = 0.6;
float depthScale = 3.5;

texture baseTexture < string ResourceName = ""; >;

sampler baseSample = sampler_state 
{ texture = <baseTexture>;
  mipFilter = linear;
  magFilter = linear;
  minFilter = linear;
  addressU = wrap;
  addressV = wrap;
};

texture breakerTexture < string ResourceName = ""; >;

sampler breakerSample = sampler_state 
{ texture = <breakerTexture>;
  mipFilter = linear;
  magFilter = linear;
  minFilter = linear;
  addressU = wrap;
  addressV = wrap;
};

texture heightMapTexture < string ResourceName = ""; >;

sampler heightMapSample = sampler_state 
{ texture = <heightMapTexture>;
  mipFilter = linear;
  magFilter = linear;
  minFilter = linear;
  addressU = wrap;
  addressV = wrap;
};


struct VSInput
{ float4 pos   : position;
  float2 UV    : texcoord0;
};

struct VSOutput
{ float4 pos   : position;
  float2 UV    : texcoord0;
};

struct PSInput
{ float2 UV : texcoord0;
};

struct PSOutput {  float4 col : Color; };

VSOutput VShader(VSInput In, VSOutput Out)
{ Out.pos = mul(In.pos, wvp);
  Out.UV = In.UV;
  return Out;
}

PSOutput PShader(PSInput In, PSOutput Out)
{ float height = (dot(tex2D(heightMapSample, In.UV).rgb, 1.0.rrr)/3);
  float sea = step(height, seaLevel);
  float depth = saturate((seaLevel - height)  * depthScale);
  float4 colour = lerp(tex2D(heightMapSample, In.UV), tex2D(baseSample, In.UV), sea);
  float random = (dot(tex2D(baseSample, In.UV +seconds*(0.01)).rgb, 1.0.rrr)/3);
  float4 breaker = tex1D(breakerSample, frac((depth+(random*0.01)) +0.0)*(random*0.8));
  float4 breaker2 = tex1D(breakerSample, frac((depth+(random*0.01)) +seconds*(0.4))*(random*0.8));
  Out.col = ((breaker + breaker2)*0.5) * (1.0 - depth) * sea * (random) * 0.6;
  return Out;
}

technique test
{  pass p0
   {  
        ZEnable = true;
        ZWriteEnable = false;
        AlphaBlendEnable = true; 
        SrcBlend = One; 
        DestBlend = One;

	vertexShader = compile vs_2_0 VShader();
      pixelShader  = compile ps_2_0 PShader();
   }
}
