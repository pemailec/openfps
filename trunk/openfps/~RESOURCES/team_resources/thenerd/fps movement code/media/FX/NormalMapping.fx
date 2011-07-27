//====================================================
// NormalMapping
//====================================================
// By EVOLVED
// www.evolved-software.com
//====================================================

//--------------
// un-tweaks
//--------------
   matrix WorldVP:WorldViewProjection; 
   matrix World:World;    
   matrix ViewInv:ViewInverse; 
   matrix WorldInv:WorldInverse;

//--------------
// tweaks
//--------------
   float3 Ambient={0.1f,0.1f,0.1f};  
   float3 LightPosition={150.0f,150.0f,0.0f};    
   float3 LightColor={1.0f,1.0f,1.0f};    
   float LightRange=200.0f;         
   float4 FogColor={0.8f,0.8f,0.8f,1.0f};
   float FogRange=2500.0f;
   float Alpha=1.0f;

//--------------
// Textures
//--------------
   texture BaseTX <string Name="";>;	
   sampler2D Base = sampler_state 
    {
 	texture = <BaseTX>;
    };
   texture NormalTX <string Name="";>;	
   sampler2D Normal = sampler_state 
    {
 	texture = <NormalTX>;
    };
   texture NormalizerTX <string Name = "";>;
   samplerCUBE Normalizer  = sampler_state 
    {
	Texture = <NormalizerTX>;
 	ADDRESSU =  Clamp;
	ADDRESSV =  Clamp;
    };

//--------------
// structs 
//--------------
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD; 
	float3 Normal:NORMAL;
 	float3 Tangent:TANGENT;
 	float3 Binormal:BINORMAL;
     };
   struct output
     {
	float4 OPos:POSITION; 
 	float2 Tex:TEXCOORD0; 
  	float3 LightVec:TEXCOORD1; 
	float3 Attenuation:TEXCOORD2;
	float3 ViewVec:TEXCOORD3; 
	float Fog:FOG;
     };

//--------------
// vertex shader
//--------------
   output VS(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.Tex=IN.UV;
	float3x3 TBN={-IN.Tangent,IN.Binormal,IN.Normal};
	TBN=transpose(mul(TBN,World));
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition-WPos; 
	float3 ViewPos=ViewInv[3].xyz-WPos;
	OUT.LightVec=mul(LightPos,TBN);
	OUT.Attenuation=-(LightPos/LightRange); 
 	OUT.ViewVec=mul(ViewPos,TBN); 
	OUT.Fog=1-saturate(dot(ViewPos/FogRange,ViewPos/FogRange));
	return OUT;
     }

//--------------
// pixel shader
//--------------
   float4 PS(output IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.Tex); 
	float3 NormalMap=tex2D(Normal,IN.Tex)*2-1; 
	float3 LightV=texCUBE(Normalizer,IN.LightVec)*2-1;  	
	float3 View=texCUBE(Normalizer,IN.ViewVec)*2-1;
	float Normal=saturate(dot(reflect(-View,NormalMap),LightV));
	Normal=Normal*Normal; Normal=Normal*Normal; Normal=Normal*Normal; 
	Normal=Normal+saturate(dot(NormalMap,LightV)); 
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor;
	return float4(Texture*((Normal*Light)+Ambient),Texture.w*Alpha);
     }

//--------------
// techniques   
//--------------
   technique NormalMapping
      {
 	pass p1
      {		
 	vertexShader = compile vs_1_1 VS(); 
 	pixelShader  = compile ps_1_4 PS();
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;	
      }
      }
