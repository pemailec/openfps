  //--------------------------------
  // Refraction
  //--------------------------------
  // By Evolved
  // http://www.vector3r.com/
  //--------------------------------

  //-----------------
  // un-tweaks
  //-----------------
   matrix WorldVP:WorldViewProjection; 

  //-----------------
  // tweaks
  //----------------- 
   float U=4.0f; 
   float V=4.0f; 

  //-----------------
  // Texture
  //-----------------
    texture ScreenTX <string Name="";>;	
    sampler2D Screen=sampler_state
	{
	Texture = <ScreenTX>;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
 	};
    texture NormalmapTX <string Name=""; >; 
     sampler2D Normalmap=sampler_state 
	{
	Texture = <NormalmapTX>;
	};

  //-----------------
  // structs 
  //-----------------
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD;
     };
   struct output
     {
 	float4 OPos:POSITION; 
 	float2 Tex:TEXCOORD0; 
        float4 posview:TEXCOORD1;
     };

  //-----------------
  // vertex shader
  //-----------------
   output VS(input IN)
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.Tex=IN.UV*float2(U,V);
        float4x4 txtscale=float4x4(0.5,0,0,0.5,0,-0.5,0,0.5,0,0,0.5,0.5,0,0,0,1);
        OUT.posview=mul(txtscale,OUT.OPos);	
        return OUT;
     }

  //-----------------
  // pixel shader
  //-----------------
   float4 PS(output IN) : COLOR 
     {
        float4 distort=tex2D(Normalmap,IN.Tex)*2-1;
        distort=normalize(distort);
        float2 nuv=IN.posview.xy/IN.posview.z+distort;
        float4 Refract=tex2D(Screen,nuv)*1.1;
        return Refract;
     }

  //-----------------
  // techniques   
  //-----------------
   technique Distort
    {
     pass p1
     {		
      VertexShader = compile vs_2_0 VS(); 
      PixelShader  = compile ps_2_0 PS(); 		
     }
    }


