// -------------------------------------------------------------
// Semantics
// -------------------------------------------------------------
   matrix WVP : WORLDVIEWPROJECTION;

// -------------------------------------------------------------
// Parameters
// -------------------------------------------------------------
   float Alpha =1.0f;
   float4 Color = {1.0f, 0.6f, 0.6f, 1.0f};  
	
// -------------------------------------------------------------
// Textures and Samplers
// -------------------------------------------------------------	
texture texDiffuse < string ResourceName = ""; >;
sampler sampDiffuse = sampler_state {
	Texture = <texDiffuse>;
	MagFilter = Linear;
	MinFilter = Linear;
	MipFilter = Linear;
	//AddressU = Clamp;
	//AddressV = Clamp;
	//AddressW = Clamp;	
};

// -------------------------------------------------------------
// Input/Output channels
// -------------------------------------------------------------
struct VS_INPUT {
	float4 Pos : POSITION;
  	float2 UV : TEXCOORD0;
};

struct VS_OUTPUT {
	float4 Pos : POSITION;
  	float2 UV : TEXCOORD0;
};

struct PS_INPUT {
  	float2 UV : TEXCOORD0;
};

// -------------------------------------------------------------
// Vertex Shader function
// -------------------------------------------------------------
VS_OUTPUT VS(VS_INPUT IN, VS_OUTPUT OUT) {
	OUT.Pos = mul(IN.Pos, WVP);
    	OUT.UV = IN.UV;
    	return OUT;
}

// -------------------------------------------------------------
// Pixel Shader function
// -------------------------------------------------------------
float4 PS(PS_INPUT IN) : COLOR 
{
               float4 diffMap = tex2D( sampDiffuse,  IN.UV)*Color;
	return diffMap*Alpha;	
}

// -------------------------------------------------------------
// Technique
// -------------------------------------------------------------
technique t0 {
    pass P0 {

        ZEnable = true;
        ZWriteEnable = false;
        AlphaBlendEnable = true; 
        SrcBlend = One; 
        DestBlend = One;   
    
        // Compile Shaders
        VertexShader = compile vs_1_0 VS();
        PixelShader  = compile ps_1_0 PS();
    }
}