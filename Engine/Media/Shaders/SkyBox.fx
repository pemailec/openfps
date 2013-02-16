//====================================================
// Sky Box
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
// Textures
//--------------
   texture cubeMapTX : ENVIRONMENT <string Name = "";  >;
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
     };
   struct output
     {
 	float4 OPos:POSITION;
 	float3 View:TEXCOORD0; 
     };

//--------------
// vertex shader
//--------------
   output VS(input IN) 
    {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
	OUT.View=(mul(IN.Pos,World)-ViewInv[3].xyz); 
	return OUT;
    }

//--------------
// pixel shader
//--------------
    float4 PS(output IN)  : COLOR
     {		
	return texCUBE(cubeMap,IN.View);
     }

//--------------
// techniques   
//--------------
    technique Sky
      {
 	pass p1
      {		
 	vertexShader = compile vs_1_0 VS(); 
 	pixelShader  = compile ps_1_0 PS();	
      }
      }