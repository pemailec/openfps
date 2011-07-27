//====================================================
// Particles Shader
// By EVOLVED
//====================================================

//--------------
// un-tweaks
//--------------
   matrix ViewProj:ViewProjection;
   matrix ViewInv:ViewInverse;
   float time:Time;

//--------------
// tweaks
//--------------
   float4 ParticlePosition[100];
   float4 ParticleColor[100];
   float zshiftScale=0.001;
   float2 Rotation={1,1.0};

//--------------------------------
// Textures
//--------------------------------
   texture ParticleTX <string Name = "";>;	
   sampler Particle=sampler_state 
      {
 	Texture=<ParticleTX>;
	MagFilter=Linear;	
	MinFilter=Point;
	MipFilter=None;
      };

//--------------
// structs 
//--------------
   struct InPut
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD0; 
        float2 Index:TEXCOORD1;
     };
   struct OutPut
     {
	float4 OPos:POSITION; 
 	float2 Tex:TEXCOORD0; 
 	float4 ParColor:TEXCOORD1; 
     };

//--------------
// vertex shader
//--------------
   OutPut VS(InPut IN) 
     {
 	OutPut OUT;
	int Particle=IN.Index.x;	
	float4 NewPos=IN.Pos+float4(ParticlePosition[Particle].xyz,0);
	float zshift=1+(length(NewPos-ViewInv[3].xyz)*(zshiftScale/1.5));
	float Angle=(IN.Index.y*Rotation.x)+(time*Rotation.y);
 	float DCos=cos(Angle); 
 	float DSin=sin(Angle); 
 	float2x2 CosSin=float2x2(DCos,-DSin,DSin,DCos); 
 	float2 ScaleXY=mul(IN.UV-0.5f,CosSin);
	OUT.OPos=mul(NewPos,ViewProj)+float4(ScaleXY*(ParticlePosition[Particle].w*zshift),0,0);
 	OUT.Tex=-IN.UV;
  	OUT.ParColor=ParticleColor[Particle];
	return OUT;
     }

//--------------
// pixel shader
//--------------
    float4 PS(OutPut IN)  : COLOR
     {
	float4 ParTexture=tex2D(Particle,IN.Tex.xy)*IN.ParColor;
	return float4(ParTexture);
     }

//--------------
// techniques   
//--------------
   technique Particle
      {
 	pass p0
      {		
	vertexShader= compile vs_2_0 VS(); 
 	pixelShader = compile ps_2_0 PS(); 
      }
      }