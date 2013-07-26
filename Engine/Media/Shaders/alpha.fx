sampler2D implicitInputSampler : register(S0);
float Alpha = 0.1f;
float4 main(float2 uv : TEXCOORD) : COLOR
{
 float4 color = tex2D( implicitInputSampler, uv );
 float4 invertedColor = float4(color.rgb, 0.05);
 return invertedColor;
}

technique Main
{
	pass P0
	{
		PixelShader = compile ps_2_0 main();
	}
}
