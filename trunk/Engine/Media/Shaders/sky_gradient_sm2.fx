// GRADIENT SKY SHADER
// By CuCuMBeR Edited by Sasuke
//--------------------------------

// -------------------------------------------------------------
// Compilation switches
// -------------------------------------------------------------
//#define LINEAR_INTERPOLATION
#define HERMITE_INTERPOLATION

// -------------------------------------------------------------
// Semantic mappings
// -------------------------------------------------------------
float4x4 matWorldIT : WORLDIT;
float4x4 WorldVP:WorldViewProjection;

float3 fogColor       = {0.0, 0.0, 0.0};
float3 horizonColor   = {0.0, 0.0, 0.0};
float3 skyLowerColor  = {0.0, 0.0, 0.0};
float3 skyUpperColor  = {0.0, 0.0, 0.0};

float  FOG_LEVEL       = 0.0;
float  HORIZON_LEVEL   = 0.0;
float  SKY_LOWER_LEVEL = 0.0;
float  SKY_UPPER_LEVEL = 0.0;

// -------------------------------------------------------------
// Input/Output channels
// -------------------------------------------------------------
struct VS_INPUT 
{
	float4 position : POSITION;			
	float2 texCoord : TEXCOORD;	
	float3 normal : NORMAL;	
};
struct VS_OUTPUT 
{
	float4 position : POSITION;
	float2 texCoord : TEXCOORD0;
	float normalY : TEXCOORD1;
	
};
#define PS_INPUT VS_OUTPUT

// -------------------------------------------------------------
// Vertex Shader
// -------------------------------------------------------------
VS_OUTPUT VS(VS_INPUT IN) 
{
	VS_OUTPUT OUT;
	
	OUT.position = mul(IN.position, WorldVP);
	OUT.texCoord = IN.texCoord;
	OUT.normalY = IN.normal.y;
	
	return OUT;
}

// -------------------------------------------------------------
// Miscellaneous Functions
// -------------------------------------------------------------
float3 interpolate(float3 origin, float3 destination, float startStep, float endStep, float step)
{
	#ifdef HERMITE_INTERPOLATION
		return lerp(origin, destination, smoothstep(startStep, endStep, step));
	#elif defined(LINEAR_INTERPOLATION)
		return lerp(origin, destination, saturate((step - startStep) / (endStep - startStep)));
	#else // Fallback so that it compiles...
		return 0.0f.rrr;
	#endif
}

// -------------------------------------------------------------
// Pixel Shader Functions
// -------------------------------------------------------------
float4 PS(PS_INPUT IN) : COLOR
{
	float theta = IN.normalY;
	float3 color;

        if(theta > FOG_LEVEL)
	        color = interpolate(fogColor, horizonColor, FOG_LEVEL, HORIZON_LEVEL, theta);	
	if(theta > HORIZON_LEVEL)
		color = interpolate(horizonColor, skyLowerColor, HORIZON_LEVEL, SKY_LOWER_LEVEL, theta);		
	if(theta > SKY_LOWER_LEVEL)
		color = interpolate(skyLowerColor, skyUpperColor, SKY_LOWER_LEVEL, SKY_UPPER_LEVEL, theta);


	return float4(color, 1);
}

// -------------------------------------------------------------
// Techniques
// -------------------------------------------------------------
technique TSM
{
    pass P1
    {
		VertexShader = compile vs_2_0 VS();
		PixelShader = compile ps_2_0 PS();
		ZWriteEnable = false;
    }
}