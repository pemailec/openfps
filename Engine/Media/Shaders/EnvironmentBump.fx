//====================================================
// Environment Bump Mapping
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
   float seconds : Time;
 
//--------------
// tweaks
//--------------
   float3 LightColor={1.0f,1.0f,1.0f};
   float3 Lightdir={0.5f,-0.5f,-0.5f};
   float3 Ambient={0.4f,0.4f,0.4f};
   float ReflectFactor=0.5f;
   float SunReflectFactor=1.0f;
   float4 FogColor={0.88f,0.90f,0.86f,1.0f};
   float FogRange=380.0f;
   float Alpha=1.0f;
   float horizontal = 0.0;
   float vertical = 6.2832;   //2pi
   float invSize = 0.05;      // assumes object size is 100 (i.e. 1/100 = 0.01)
   float timeScale = 8.0;
   float objectScale = 100.0;  // set this to about 25% of object size
   float seascale = 0.0f;
   float actualtime = 0.0;

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
   texture cubeMapTX : ENVIRONMENT<string Name = "";>;
   samplerCUBE cubeMap = sampler_state 
      {
	Texture = <cubeMapTX>;
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
    	float3 ViewPos:TEXCOORD1; 
  	float3 tbnRow1:TEXCOORD2; 
  	float3 tbnRow2:TEXCOORD3; 
  	float3 tbnRow3:TEXCOORD4;
 	float3 Normals:TEXCOORD5; 
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
	float3 WPos=mul(IN.Pos,World);
	float3 View=WPos-ViewInv[3].xyz;  
	OUT.ViewPos=View;
	float3x3 TBN={IN.Tangent,IN.Binormal,IN.Normal};
	TBN=transpose(mul(TBN,World));
	OUT.tbnRow1=TBN[0];
	OUT.tbnRow2=TBN[1];
	OUT.tbnRow3=TBN[2];
	OUT.Normals=normalize(mul(IN.Normal,World))*(IN.Pos.y*seascale)+seascale*2;
 	OUT.Fog=1-saturate(dot(View/FogRange,View/FogRange));
	return OUT;
    }

//--------------
// pixel shader
//--------------
    float4 PS(output IN)  : COLOR
     {		
  	float4 Texture=tex2D(Base,IN.Tex);
	float NewFog=IN.Fog;
	float3 NormalMap=tex2D(Normal,IN.Tex)*2-1;
    	float3 worldNorm;
    	worldNorm.x=mul(IN.tbnRow1,NormalMap.xyz);
    	worldNorm.y=mul(IN.tbnRow2,NormalMap.xyz);
    	worldNorm.z=mul(IN.tbnRow3,NormalMap.xyz);
    	float3 lookup=reflect(IN.ViewPos,worldNorm);
  	float3 Cube=texCUBE(cubeMap,lookup);
	float Light=saturate(dot(-Lightdir,IN.Normals));
	float4 Final =float4(lerp(Texture,Cube,tex2D(Normal,IN.Tex).w*ReflectFactor)*((Light*LightColor)+Ambient),Texture.w *Alpha);
	return Final;

     }



//--------------
// techniques   
//--------------
    technique Cubemap
      {
 	pass p1
      {		
 	vertexShader = compile vs_3_0 VS(); 
 	pixelShader  = compile ps_1_4 PS();
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
        AlphaBlendEnable = TRUE;
        DestBlend = INVSRCALPHA;
        SrcBlend = SRCALPHA;
      }
      }
