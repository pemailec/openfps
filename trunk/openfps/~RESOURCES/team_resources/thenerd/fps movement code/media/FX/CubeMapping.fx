//====================================================
// Cube Mapping
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
 
//--------------
// tweaks
//--------------
   float3 LightColor={1.0f,1.0f,1.0f};
   float3 Lightdir={0.5f,-0.5f,-0.5f};
   float3 Ambient={0.2f,0.2f,0.2f};
   float ReflectFactor=0.5f;
   float4 FogColor={0.8f,0.8f,0.8f,1.0f};
   float FogRange=2500.0f;
   float Alpha=0.6f;
 
//--------------
// Textures
//--------------
   texture BaseTX <string Name="";>;	
   sampler2D Base = sampler_state 
      {
     	texture = <BaseTX>;
      };
   texture cubeMapTX : ENVIRONMENT <string Name = ""; >;
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
       };
   struct output
       {
 	float4 OPos:POSITION; 
    	float2 Tex:TEXCOORD0; 
 	float3 Ref:TEXCOORD1; 
 	float3 Normals:TEXCOORD2; 
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
	float3 WNor=mul(IN.Normal,World); WNor=normalize(WNor);
	float3 WPos=mul(IN.Pos,World); 
	float3 View=WPos-ViewInv[3].xyz; 
	OUT.Ref=reflect(View,WNor); 
	OUT.Normals=WNor;
 	OUT.Fog=1-saturate(dot(View/FogRange,View/FogRange));
	return OUT;
    }

//--------------
// pixel shader
//--------------
    float4 PS(output IN)  : COLOR
     {		
   	float4 Texture=tex2D(Base,IN.Tex);
	float3 Cube=texCUBE(cubeMap,IN.Ref);
	float Light=saturate(dot(-Lightdir,IN.Normals));
	return float4(lerp(Texture,Cube,ReflectFactor)*((Light*LightColor)+Ambient),Texture.w*Alpha);
     }

//--------------
// techniques   
//--------------
    technique Cubemap
      {
 	pass p1
      {		
 	vertexShader = compile vs_1_1 VS(); 
 	pixelShader  = compile ps_1_4 PS();	
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;	
      }
      }