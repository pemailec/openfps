Texture g_Tex : register(t0);
sampler2D s = sampler_state {
	Texture = <g_Tex>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
};

float4 Weights = {1.0, 1.0, 1.0, 0.0};
float Speed = 0.8f;

float4 Remove_Alpha ( float2 texCoords : TEXCOORD0 ) : COLOR
{
	float4 In = tex2D(s, texCoords);
	float Red = dot(In, float4(1.0, 0.0, 0.0, 0.0));
	float Green = dot(In, float4(0.0, 1.0, 0.0, 0.0));
	float Blue = dot(In, float4(0.0, 0.0, 1.0, 0.0));
	float Gray = dot(In, float4(0.0, 0.0, 0.0, Speed));
	return float4(Red, Green, Blue, Gray);
}


technique Remove_Alpha
{
	pass P0
	{
		PixelShader = compile ps_2_0 Remove_Alpha();
	}
}

