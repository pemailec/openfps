//====================================================
// Flash Light
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
   matrix ViewMat={0.5,0,0,0.5,0,-0.5,0,0.5,0,0,0.5,0.5,0,0,0,1};

//--------------
// tweaks
//--------------
   float4 LightPosition={150.0f, 150.0f, 0.0f, 1.0f};    
   float LightRange=1000.0f;      
   float BrightNess=1.0f;
   matrix LightProjMatrix;
   float3 LightPosition_1={0.0f, 50.0f, 0.0f};    
   float3 LightColor_1={1.0f, 1.0f, 1.0f};    
   float  LightRange_1=55.0f;    
   float3 LightPosition_2={50.0f, 50.0f, 0.0f}; 
   float3 LightColor_2={1.0f, 0.0f, 0.0f};    
   float  LightRange_2=55.0f; 
   float3 LightPosition_3={100.0f, 50.0f, 0.0f};     
   float3 LightColor_3={0.0f, 1.0f, 0.0f};    
   float  LightRange_3=55.0f; 
   float3 LightPosition_4={150.0f, 50.0f, 0.0f};       
   float3 LightColor_4={0.0f, 0.0f, 1.0f};    
   float  LightRange_4=55.0f;    
   float3 LightPosition_5={0.0f, 50.0f, 50.0f};    
   float3 LightColor_5={1.0f, 1.0f, 1.0f};    
   float  LightRange_5=55.0f;    
   float3 LightPosition_6={50.0f, 50.0f, 50.0f}; 
   float3 LightColor_6={1.0f, 0.0f, 0.0f};    
   float  LightRange_6=55.0f;   
   float4 FogColor={0.4f, 0.36f, 0.3f, 1.0f};
   float FogRange=4000.0f;
   float Alpha=1.0f;

//--------------
// Textures
//--------------
   texture BaseTX <string Name="";>;	
   sampler Base = sampler_state 
      {
     	texture = <BaseTX>;
      };
   texture LightmapTX <string Name="";>;	
   sampler Lightmap = sampler_state 
      {
 	texture = <LightmapTX>;
      };
   texture ProjetLightTX <string Name = "";>;
   sampler ProjetLight = sampler_state
      {
	Texture = <ProjetLightTX>;
	AddressU=Border;
	AddressV=Border;
	AddressW=Border;
	MagFilter=Linear;	
	MinFilter=Point;
	MipFilter=None;
      };

//--------------
// structs 
//--------------
   struct Finput
     {
 	float4 Pos:POSITION; 
 	float2 UVA:TEXCOORD0; 
 	float2 UVB:TEXCOORD1; 
	float3 Normal:NORMAL;
     };
   struct Foutput
     {
	float4 OPos:POSITION; 
 	float2 TexA:TEXCOORD0;
   	float2 TexB:TEXCOORD1;
	float3 Attenuation:TEXCOORD2;
	float  Diffuse:TEXCOORD3;
    	float4 Proj:TEXCOORD4;
	float Fog:FOG;
     };
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UVA:TEXCOORD0; 
	float3 Normal:NORMAL;
     };
   struct output
     {
	float4 OPos:POSITION; 
 	float2 TexA:TEXCOORD0;  
	float3 Attenuation:TEXCOORD1;
	float Diffuse:TEXCOORD2;
     };
   struct output0
     {
	float4 OPos:POSITION; 
 	float2 TexA:TEXCOORD0;
	float3 Attenuation:TEXCOORD1;
	float Diffuse:TEXCOORD2;
	float3 Attenuation0:TEXCOORD3;
	float Diffuse0:TEXCOORD4;
     };

//--------------
// vertex shader
//--------------
   Foutput VS(Finput IN) 
     {
 	Foutput OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	OUT.TexB=IN.UVB;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition-WPos; 
	OUT.Attenuation=-LightPos/LightRange;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
       	OUT.Proj=mul(ViewMat,mul(float4(LightPos,1),LightProjMatrix));
	float3 ViewPos=ViewInv[3].xyz-WPos;
 	OUT.Fog=1-saturate(dot(ViewPos/FogRange,ViewPos/FogRange));
	return OUT;
     }
   output VS_L1(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_1-WPos; 
	OUT.Attenuation=-LightPos/LightRange_1;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }
   output0 VS_L2(input IN) 
     {
 	output0 OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_1-WPos; 
	OUT.Attenuation=-LightPos/LightRange_1;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	LightPos=LightPosition_2-WPos; 
	OUT.Attenuation0=-LightPos/LightRange_2;
 	OUT.Diffuse0=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }
   output VS_L3(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_3-WPos; 
	OUT.Attenuation=-LightPos/LightRange_3;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }
   output0 VS_L4(input IN) 
     {
 	output0 OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_3-WPos; 
	OUT.Attenuation=-LightPos/LightRange_3;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	LightPos=LightPosition_4-WPos; 
	OUT.Attenuation0=-LightPos/LightRange_4;
 	OUT.Diffuse0=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }
   output VS_L5(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_5-WPos; 
	OUT.Attenuation=-LightPos/LightRange_5;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }
   output0 VS_L6(input IN) 
     {
 	output0 OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.TexA=IN.UVA;
	float3 Wnor=mul(IN.Normal,World); Wnor=normalize(Wnor);
	float3 WPos=mul(IN.Pos,World);  
	float3 LightPos=LightPosition_5-WPos; 
	OUT.Attenuation=-LightPos/LightRange_5;
 	OUT.Diffuse=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	LightPos=LightPosition_6-WPos; 
	OUT.Attenuation0=-LightPos/LightRange_6;
 	OUT.Diffuse0=saturate(0.05f+mul(Wnor,LightPos)*0.05f); 
	return OUT;
     }

//--------------
// pixel shader
//--------------
    float4 PS(Foutput IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA);
 	float3 LightM=tex2D(Lightmap,IN.TexB);
        LightM +=LightM;
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	PixelLight=(PixelLight*IN.Diffuse)*BrightNess;
 	float3 FlashLight=tex2Dproj(ProjetLight,IN.Proj)*PixelLight;
	return float4(Texture*(LightM+FlashLight),Texture.w*Alpha);
     }
    float4 PS_L1(output IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA);
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_1*IN.Diffuse;
	return float4(Texture*Light,Texture.w*Alpha);
     }
    float4 PS_L2(output0 IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA);
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_1*IN.Diffuse;
	PixelLight=1-saturate(dot(IN.Attenuation0,IN.Attenuation0));
	Light=Light+PixelLight*LightColor_2*IN.Diffuse0;
	return float4(Texture*Light,Texture.w*Alpha);
     }
    float4 PS_L3(output IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA); 
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_3*IN.Diffuse;
	return float4(Texture*Light,Texture.w*Alpha);
     }
    float4 PS_L4(output0 IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA);
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_3*IN.Diffuse;
	PixelLight=1-saturate(dot(IN.Attenuation0,IN.Attenuation0));
	Light=Light+PixelLight*LightColor_4*IN.Diffuse0;
	return float4(Texture*Light,Texture.w*Alpha);
     }
    float4 PS_L5(output IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA); 
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_5*IN.Diffuse;
	return float4(Texture*Light,Texture.w*Alpha);
     }
    float4 PS_L6(output0 IN)  : COLOR
     {
	float4 Texture=tex2D(Base,IN.TexA);
	float PixelLight=1-saturate(dot(IN.Attenuation,IN.Attenuation));
	float3 Light=PixelLight*LightColor_5*IN.Diffuse;
	PixelLight=1-saturate(dot(IN.Attenuation0,IN.Attenuation0));
	Light=Light+PixelLight*LightColor_6*IN.Diffuse0;
	return float4(Texture*Light,Texture.w*Alpha);
     }

//--------------
// techniques   
//--------------
   technique Light0
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
      }
   technique Light1
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L1(); 
 	pixelShader  = compile ps_2_0 PS_L1();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One; 	
      }
      }
   technique Light2
      {
 	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
 	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L2(); 
 	pixelShader  = compile ps_2_0 PS_L2(); 
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;	
      }
      }
   technique Light3
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS();
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;	 	
      }
	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L2(); 
 	pixelShader  = compile ps_2_0 PS_L2(); 
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;	
      }
 	pass p2
      {		
 	vertexShader = compile vs_2_0 VS_L3(); 
 	pixelShader  = compile ps_2_0 PS_L3();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
      }
   technique Light4
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
 	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L2(); 
 	pixelShader  = compile ps_2_0 PS_L2(); 	
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
 	pass p2
      {		
 	vertexShader = compile vs_2_0 VS_L4(); 
 	pixelShader  = compile ps_2_0 PS_L4();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
      }
  technique Light5
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
 	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L2(); 
 	pixelShader  = compile ps_2_0 PS_L2(); 	
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
 	pass p2
      {		
 	vertexShader = compile vs_2_0 VS_L4(); 
 	pixelShader  = compile ps_2_0 PS_L4();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
 	pass p3
      {		
 	vertexShader = compile vs_2_0 VS_L5(); 
 	pixelShader  = compile ps_2_0 PS_L5();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
      }
   technique Light6
      {
  	pass p0
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS(); 
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
	pass p1
      {		
 	vertexShader = compile vs_2_0 VS_L2(); 
 	pixelShader  = compile ps_2_0 PS_L2(); 	
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
 	pass p2
      {		
 	vertexShader = compile vs_2_0 VS_L4(); 
 	pixelShader  = compile ps_2_0 PS_L4();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
 	pass p3
      {		
 	vertexShader = compile vs_2_0 VS_L6(); 
 	pixelShader  = compile ps_2_0 PS_L6();
	AlphaBlendEnable = True;
 	SrcBlend = One;
 	DestBlend = One;
      }
      }