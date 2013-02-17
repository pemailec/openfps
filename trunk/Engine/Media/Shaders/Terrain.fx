//
// Fast Bone
//

/************* UNTWEAKABLES **************/

float4x4 WorldIT : WorldInverseTranspose;
float4x4 WorldViewProj : WorldViewProjection;
float4x4 World : World;
float4x4 ViewInv : ViewInverse;

/*********** DBPRO UNTWEAKABLES **********/
float4x4 boneMatrix[32] : BoneMatrixPalette;

/************* SURFACE **************/

float4 lhtDir < string UIDirectional = "Light Direction"; >; 

float4 LightPos : Position
<
    string UIObject = "PointLight";
    string Space = "World";
> = {100.0f, 100.0f, -100.0f, 0.0f};

float4 LightColor
<
	string UIType = "Color";
> = {0.75f, 0.75f, 0.75f, 1.0f};

float4 AmbiColor : Ambient
<
    string UIName =  "Ambient Light Color";
> = {0.01f, 0.01f, 0.01f, 1.0f};

float4 SurfColor : Diffuse
<
    string UIName =  "Surface Color";
    string UIType = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

/************* TEXTURES **************/

texture colorTexture : DiffuseMap
<
    string Name = "default_color.dds";
    string type = "2D";
>;

sampler2D colorSampler = sampler_state
{
	Texture = <colorTexture>;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
};

/************* DATA STRUCTS **************/

struct appdata {
    float3 Position	: POSITION;
    float4 UV		: TEXCOORD0;
    float4 Normal	: NORMAL;
    float4 Blendweight	: TEXCOORD1;
    float4 Blendindices	: TEXCOORD2;
};

/* data passed from vertex shader to pixel shader */
struct vertexOutput {
    float4 HPosition	: POSITION;
    float4 TexCoord	: TEXCOORD0;
    float4 Col		: COLOR;
};

/*********** vertex shader ******/

vertexOutput mainVS(appdata IN)
{
    vertexOutput OUT;
    OUT.OPos = mul(IN.Pos,WorldVP);
    OUT.Tex=IN.UV;
    return OUT;
}

float4 PS(
    float4 Diff : COLOR0,
    float2 Tex  : TEXCOORD0) : COLOR
{
    return tex2D(colorSampler, Tex) * Diff;
}

/****** technique *******/

technique dx9textured
{
	pass p0 
	{		
	        Sampler[0] = (colorSampler);
		VertexShader = compile vs_2_0 mainVS();
	        PixelShader  = compile ps_1_0 PS();
	}
}
