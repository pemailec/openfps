string Description = "Cinematic Filmgrain Shader with Color Correction";
//Released under Creative Commons license 3.0.  Credit to Pat 'Hawthorne' Shearon and Georg 'Leviathan' Steinröhder for noise generation algorithm.
//Shader code by Mark Blosser
//mjblosser@gmail.com
//Global Variables
float time : Time;

float2 ViewSize : ViewSize;


float Color
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 1.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 0.60;

float Monochrome
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 1.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 0.40;

float BrownSepia
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 1.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 0.0;

float GreenSepia
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 1.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 0.0;

float BlueSepia
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 1.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 0.0;

float Contrast
<
string UIWidget = "slider";
    float UIMin = 0;
    float UIMax = 5.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = 1.40;

float Brightness
<
string UIWidget = "slider";
    float UIMin = -1;
    float UIMax = 2.0;
    float UIStep = 0.1;
    string UIName =  "filmgrain amount";
> = -0.20;


//scene image
texture frame : RENDERCOLORTARGET
< 
	string ResourceName = "";
	float2 ViewportRatio = { 1, 1 };
>;

sampler2D frameSamp = sampler_state {
    Texture = < frame >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

struct input 
{
	float4 pos : POSITION;
	float2 uv : TEXCOORD0;
};
 
struct output {

	float4 pos: POSITION;
	float2 uv: TEXCOORD0;

};

output VS( input IN ) 
{
	output OUT;

	//quad needs to be shifted by half a pixel.
    //Go here for more info: http://www.sjbrown.co.uk/?article=directx_texels
    
	float4 oPos = float4( IN.pos.xy + float2( -1.0f/ViewSize.x, 1.0f/ViewSize.y ),0.0,1.0 );
	OUT.pos = oPos;

	float2 uv = (IN.pos.xy + 1.0) / 2.0;
	uv.y = 1 - uv.y; 
	OUT.uv = uv;
	
	return OUT;	
}

///Pixel shader
float4 ps_main( float2 Tex : TEXCOORD0  ) : COLOR0 
{
	//-------Color Matrices for Color Correction--------------

float4x4 gray = {0.299,0.587,0.184,0,
                  0.299,0.587,0.184,0,
                  0.299,0.587,0.184,0,
                  0,0,0,1};
                  
                  
float4x4 sepia = {0.299,0.587,0.184,0.1,
                  0.299,0.587,0.184,0.018,
                  0.299,0.587,0.184,-0.090,
                  0,0,0,1};
                  
float4x4 sepia2 = {0.299,0.587,0.184,-0.090,
                  0.299,0.587,0.184,0.018,
                  0.299,0.587,0.184,0.1,
                  0,0,0,1};
                  
float4x4 sepia3 = {0.299,0.587,0.184,-0.090,
                  0.299,0.587,0.184,0.1,
                  0.299,0.587,0.184,0.1,
                  0,0,0,1};
//float4x4 sepia4 = {0.299,0.587,0.184,-0.090,
                 // 0.299,0.587,0.184,0.018,
                 // 0.1299,0.587,0.184,0.1,
                 // 0,0,0,1};
float4x4 sepia4 = {0.299,0.587,0.184,-0.090,
                  0.299,0.587,0.184,0.018,
                  0.1299,0.587,0.184,0.1,
                  0,0,0,1};
                  
//---------------------------------------------------------------
	
	// sample the source
	float4 cTextureScreen = tex2D( frameSamp, Tex.xy);

	float3 cResult = cTextureScreen.rgb + cTextureScreen.rgb * saturate(0.1f);

	float2 sc; sincos(0, sc.x, sc.y);
	
	// interpolate between source and result by intensity
	cResult = lerp(cTextureScreen, cResult,0);
	
	//cResult.rgb = (cResult.r * 0.3f + cResult.g * 0.59f + cResult.b * 0.11f);
	float3 monochrome = (cResult.r * 0.3f + cResult.g * 0.59f + cResult.b * 0.11f);
	float4 monochrome4 = float4(monochrome,1);
	//cResult.rgb =  (Color * cResult.rgb) + (monochrome* Monochrome);
	
	float4 result2 = float4(cResult,1);

	float4 brownsepia = mul(sepia,result2) ;
    float4 greensepia = mul(sepia3,result2) ;
    float4 bluesepia = mul(sepia2,result2) ;
     
	// return with source alpha

	float4 combine =  (brownsepia *BrownSepia ) + (greensepia *GreenSepia )+ (bluesepia *BlueSepia )+ (monochrome4 *Monochrome)+(Color * result2);
	return (combine  * Contrast)  + Brightness;
	
} 






technique Negative
<
	//the initial texture we want DarkBASIC Professional to place the scene
	string RenderColorTarget = "frame";
>
{
	pass Negative
	<
		//use a blank render target to draw to the screen
		string RenderColorTarget = "";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_2_0 VS();
		PixelShader = compile ps_2_0 ps_main(  );
	}
}