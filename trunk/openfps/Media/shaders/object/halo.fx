string Description = "This shader will make the edge of the object brighter than the rest to produce a halo effect. Works best on curved objects.";
string Thumbnail = "Halo.png";

float4x4 WorldViewProj : WorldViewProjection;
float4x4 World : World;
float4x4 WorldView : WorldView;
float4 eyePos : CameraPosition;

float MinLimit
<
	string UIWidget = "slider";
	float UIMax = 1.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 0.4;

float MaxLimit
<
	string UIWidget = "slider";
	float UIMax = 1.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 0.8;

texture BaseTex
<
	string ResourceName = "";
>;

sampler BaseSmp = sampler_state 
{
	Texture = <BaseTex>;
	MinFilter = Anisotropic;
	MagFilter = Linear;
	MipFilter = Linear;
	AddressU = Wrap;
	AddressV = Wrap;
};

struct app_in
{
	float4 pos : POSITION;
	float2 uv : TEXCOORD0;
	float3 normal : NORMAL;
};

struct vs_out
{
	float4 pos : POSITION;
	float2 uv : TEXCOORD0;
	float3 wNormal : TEXCOORD1;
	float4 wPos : TEXCOORD2;
};

vs_out DefaultVertexShader( app_in IN )
{
	vs_out OUT;
	
	OUT.pos = mul( IN.pos, WorldViewProj );
	OUT.uv = IN.uv;
	
	float4 wPos = mul( IN.pos, World );
	float3 wNormal = mul( IN.normal, (float3x3)World );
	
	OUT.wNormal = normalize(wNormal);
	OUT.wPos = wPos;
	
	return OUT;
}

float4 DefaultPixelShader( vs_out IN ) : COLOR
{
	//calculate the angle between the normal and the camera
	float3 viewDir = normalize(eyePos - IN.wPos);
	float angle = saturate( dot( IN.wNormal, viewDir ) );
	
	//limit the angle
	angle = smoothstep( MinLimit, MaxLimit, angle );
	
	//use this value to produce a color
	float4 color = lerp( float4( 0.6,0.6,0.6,0), float4(0.2,0.2,0.2,0), angle );
	
	return tex2D( BaseSmp, IN.uv ) * (float4(color.xyz,1)*tex2D( BaseSmp, IN.uv )*3)*12;
}

technique MyShader
{
	pass p0
	{
		VertexShader = compile vs_1_1 DefaultVertexShader( );
		PixelShader = compile ps_2_0 DefaultPixelShader( );
	}
}