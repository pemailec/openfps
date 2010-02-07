  //--------------------------------
  // By Evolved
  // http://www.vector3r.com/
  //--------------------------------

  //-----------------
  // un-tweaks
  //-----------------
   matrix WorldVP:WorldViewProjection; 

  //-----------------
  // Textures
  //-----------------
   texture BaseTX
    <
	string Name="";
    >;	
   sampler2D Base = sampler_state 
    {
 	texture = <BaseTX>;
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
     };

  //-----------------
  // vertex shader
  //-----------------
    output VS(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.Tex=IN.UV;
	return OUT;
     }

  //-----------------
  // pixel shader
  //-----------------
    float4 PS(output IN)  : COLOR
     {
	return tex2D(Base,IN.Tex); 
     }

  //-----------------
  // techniques   
  //-----------------
   technique Null
      {
 	pass p1
      {		
 	vertexShader = compile vs_1_1 VS(); 
  	pixelShader  = compile ps_1_1 PS(); 	
      }
      }
