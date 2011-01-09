/*****************************************************
Gloss.fx - Gloss Mapping Effect
By: Preston "NWC_Omega" Chaderton

This is a multi-texture, single pass shader that does a
simple job.  It modifies the specular component of a 
model by the gloss map texture (a gray scale texture 
which determines where the "shiny" and "less shiny" areas
are on a mesh.  Simply put, it just multiplies the specular
component by the gloss map texture color.

It was created in FX Composer and then in Notepad for use in
Dark Basic Pro.  It compiles under VS 1.1 and PS 1.1 for the
less powerful computers.

It runs at 343 FPS on my Intel Celeron 1.3 Ghrz, 512 MB
Ram, NVIDIA GeForce FX 5200 when applied to a sphere 
with 3278 triangles in a test program running at 
640x480x32.

****************************************************/  

// light direction (view space)
float3 lightDir  = {0.577, -0.577, 0.577};

// light intensity
float4 I_a = { 0.1f, 0.1f, 0.1f, 1.0f };    // ambient
float4 I_d = { 1.0f, 1.0f, 1.0f, 1.0f };    // diffuse
float4 I_s = { 1.0f, 1.0f, 1.0f, 1.0f };    // specular

// material reflectivity
float4 k_a = { 1.0f, 1.0f, 1.0f, 1.0f};
float4 k_d = {1.0f, 1.0f, 1.0f, 1.0f};
float4 k_s = { 1.0f, 1.0f, 1.0f, 1.0f};
int n = 32;

// texture
texture Tex0 < 
                string texturetype = "2D" ; 
                string name = "base.dds"; 
             >;

texture Mix <
				string texturetype = "2D" ;
				string name = "gloss.dds" ;
			>;

// transformations
float4x4 World      : WORLD;
float4x4 View       : VIEW;
float4x4 Projection : PROJECTION;

struct VS_OUTPUT
{
    float4 Pos  : POSITION;
    float4 Diff : COLOR0;
    float4 Spec : COLOR1;
    float2 Tex  : TEXCOORD0;
    float2 TexDos  : TEXCOORD1;
};

VS_OUTPUT VS(
    float3 Pos  : POSITION, 
    float3 Norm : NORMAL, 
    float2 Tex  : TEXCOORD0)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;

    float3 L = -lightDir;

    float4x4 WorldView = mul(World, View);

    float3 P = mul(float4(Pos, 1), (float4x3)WorldView);  // position (view space)
    float3 N = normalize(mul(Norm, (float3x3)WorldView)); // normal (view space)

    float3 R = normalize(2 * dot(N, L) * N - L);          // reflection vector (view space)
    float3 V = -normalize(P);                             // view direction (view space)

    Out.Pos  = mul(float4(P, 1), Projection);             // position (projected)
    Out.Diff = I_a * k_a + I_d * k_d * max(0, dot(N, L)); // diffuse + ambient
    Out.Spec = I_s * k_s * pow(max(0, dot(R, V)), n/4);   // specular
    Out.Tex  = Tex;                                       
	Out.TexDos = Tex;

    return Out;
}

sampler Sampler = sampler_state
{
    Texture   = (Tex0);
    MipFilter = LINEAR;
    MinFilter = LINEAR;
    MagFilter = LINEAR;
};

sampler Mixa = sampler_state
{
    Texture   = (Mix);
    MipFilter = LINEAR;
    MinFilter = LINEAR;
    MagFilter = LINEAR;
};

float4 PS(
    float4 Diff : COLOR0,
    float4 Spec : COLOR1,
    float2 Tex  : TEXCOORD0,
    float2 TexDos : TEXCOORD1) : COLOR
{
    return ((tex2D(Sampler, Tex)))*Diff+(Spec*tex2D(Mixa,TexDos));
}

technique TVertexAndPixelShader
{
    pass P0
    {
        // shaders
        VertexShader = compile vs_1_1 VS();
        PixelShader  = compile ps_1_1 PS();
    }  
}
