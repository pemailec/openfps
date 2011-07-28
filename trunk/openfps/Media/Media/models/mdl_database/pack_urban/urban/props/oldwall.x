xof 0303txt 0032

// DirectX 9.0 file
// Creator: Ultimate Unwrap3D Pro v3.18
// Time: Mon Sep 14 04:21:57 2009

// Start of Templates

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template FVFData {
 <b6e70a0e-8ef9-4e83-94ad-ecc8b0c04897>
 DWORD dwFVF;
 DWORD nDWords;
 array DWORD data[nDWords];
}

template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template FrameTransformMatrix {
 <F6F23F41-7686-11cf-8F52-0040333594A3>
 Matrix4x4 frameMatrix;
}

template Frame {
 <3D82AB46-62DA-11cf-AB39-0020AF71E433>
 [...]
}

template FloatKeys {
 <10DD46A9-775B-11cf-8F52-0040333594A3>
 DWORD nValues;
 array FLOAT values[nValues];
}

template TimedFloatKeys {
 <F406B180-7B3B-11cf-8F52-0040333594A3>
 DWORD time;
 FloatKeys tfkeys;
}

template AnimationKey {
 <10DD46A8-775B-11cf-8F52-0040333594A3>
 DWORD keyType;
 DWORD nKeys;
 array TimedFloatKeys keys[nKeys];
}

template AnimationOptions {
 <E2BF56C0-840F-11cf-8F52-0040333594A3>
 DWORD openclosed;
 DWORD positionquality;
}

template Animation {
 <3D82AB4F-62DA-11cf-AB39-0020AF71E433>
 [...]
}

template AnimationSet {
 <3D82AB50-62DA-11cf-AB39-0020AF71E433>
 [Animation]
}

template XSkinMeshHeader {
 <3CF169CE-FF7C-44ab-93C0-F78F62D172E2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template SkinWeights {
 <6F0D123B-BAD2-4167-A0D0-80224F25FABB>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}

template AnimTicksPerSecond {
 <9E415A43-7BA6-4a73-8743-B73D47E88476>
 DWORD AnimTicksPerSecond;
}

AnimTicksPerSecond {
 4800;
}

// Start of Frames

Frame Body {
   FrameTransformMatrix {
    1.000000, 0.000000, 0.000000, 0.000000,
    0.000000, 1.000000, 0.000000, 0.000000,
    0.000000, 0.000000, 1.000000, 0.000000,
    0.000000, 0.000000, 0.000000, 1.000000;;
   }

   Mesh staticMesh {
    96;
    -102.266006; 0.000000; -5.174950;,
    -102.266006; 0.000000; 5.174950;,
    -115.311996; 0.000000; -5.174950;,
    -115.311996; 0.000000; 5.174950;,
    -86.943695; 0.000000; -5.174950;,
    -86.943695; 0.000000; 5.174950;,
    -63.285698; 0.000000; -5.174950;,
    -63.285698; 0.000000; 5.174950;,
    -48.559200; 0.000000; -5.174950;,
    -48.559200; 0.000000; 5.174950;,
    -32.113300; 0.000000; -5.174950;,
    -32.113300; 0.000000; 5.174950;,
    -14.813999; 0.000000; -5.174950;,
    -14.813999; 0.000000; 5.174950;,
    -0.013421; 0.000000; -5.174950;,
    -0.013421; 0.000000; 5.174950;,
    21.181702; 0.000000; -5.174950;,
    21.181702; 0.000000; 5.174950;,
    39.630302; 0.000000; -5.174950;,
    39.630302; 0.000000; 5.174950;,
    58.045403; 0.000000; -5.174950;,
    58.045403; 0.000000; 5.174950;,
    76.601700; 0.000000; -5.174950;,
    76.601700; 0.000000; 5.174950;,
    96.156097; 0.000000; -5.174950;,
    115.311996; 0.000000; -5.174950;,
    96.156097; 0.000000; 5.174950;,
    115.311996; 0.000000; 5.174950;,
    -102.266006; 77.243958; 5.174950;,
    -115.311996; 77.243958; 5.174950;,
    -86.943695; 77.243958; 5.174950;,
    -63.285698; 76.402359; 5.174950;,
    -48.559200; 77.243958; 5.174950;,
    -32.113300; 77.243958; 5.174950;,
    -14.813999; 77.243958; 5.174950;,
    -0.013421; 75.961060; 5.174950;,
    21.181702; 77.243958; 5.174950;,
    39.630302; 77.243958; 5.174950;,
    58.045403; 77.243958; 5.174950;,
    76.601700; 76.195259; 5.174950;,
    96.156097; 77.243958; 5.174950;,
    115.311996; 75.773758; 5.174950;,
    -102.266006; 80.551361; 2.923851;,
    -115.311996; 80.551361; 2.923851;,
    96.156097; 80.551361; 2.923851;,
    115.311996; 79.081161; 2.923851;,
    -86.943695; 80.551361; 2.923851;,
    -63.285698; 79.709755; 2.923851;,
    -48.559200; 80.551361; 2.923851;,
    -32.113300; 80.551361; 2.923851;,
    -14.813999; 80.551361; 2.923851;,
    -0.013421; 79.268456; 2.923851;,
    21.181702; 80.551361; 2.923851;,
    39.630302; 80.551361; 2.923851;,
    58.045403; 80.551361; 2.923851;,
    76.601700; 79.502655; 2.923851;,
    -102.266006; 77.474060; -5.174950;,
    -115.311996; 77.474060; -5.174950;,
    -86.943695; 77.474060; -5.174950;,
    -63.285698; 76.632561; -5.174950;,
    -48.559200; 77.474060; -5.174950;,
    -32.113300; 77.474060; -5.174950;,
    -14.813999; 77.474060; -5.174950;,
    -0.013421; 76.191261; -5.174950;,
    21.181702; 77.474060; -5.174950;,
    39.630302; 77.474060; -5.174950;,
    58.045403; 77.474060; -5.174950;,
    76.601700; 76.425461; -5.174950;,
    96.156097; 77.474060; -5.174950;,
    115.311996; 76.003960; -5.174950;,
    115.311996; 76.003960; -5.174950;,
    115.311996; 79.081161; -3.080650;,
    115.311996; 0.000000; -5.174950;,
    115.311996; 79.081161; 2.923851;,
    115.311996; 0.000000; 5.174950;,
    115.311996; 75.773758; 5.174950;,
    -115.311996; 77.474060; -5.174950;,
    -115.311996; 0.000000; -5.174950;,
    -115.311996; 80.551361; -3.080650;,
    -115.311996; 0.000000; 5.174950;,
    -115.311996; 80.551361; 2.923851;,
    -115.311996; 77.243958; 5.174950;,
    -102.266006; 80.551361; -3.080650;,
    -115.311996; 80.551361; -3.080650;,
    -86.943695; 80.551361; -3.080650;,
    -63.285698; 79.709755; -3.080650;,
    -48.559200; 80.551361; -3.080650;,
    -32.113300; 80.551361; -3.080650;,
    -14.813999; 80.551361; -3.080650;,
    -0.013421; 79.268456; -3.080650;,
    21.181702; 80.551361; -3.080650;,
    39.630302; 80.551361; -3.080650;,
    58.045403; 80.551361; -3.080650;,
    76.601700; 79.502655; -3.080650;,
    96.156097; 80.551361; -3.080650;,
    115.311996; 79.081161; -3.080650;;
    164;
    3;0, 1, 2;,
    3;1, 3, 2;,
    3;4, 5, 0;,
    3;5, 1, 0;,
    3;6, 7, 4;,
    3;7, 5, 4;,
    3;8, 9, 6;,
    3;9, 7, 6;,
    3;10, 11, 8;,
    3;11, 9, 8;,
    3;12, 13, 10;,
    3;13, 11, 10;,
    3;14, 15, 12;,
    3;15, 13, 12;,
    3;16, 17, 14;,
    3;17, 15, 14;,
    3;18, 19, 16;,
    3;19, 17, 16;,
    3;20, 21, 18;,
    3;21, 19, 18;,
    3;22, 23, 20;,
    3;23, 21, 20;,
    3;24, 25, 26;,
    3;25, 27, 26;,
    3;24, 26, 22;,
    3;26, 23, 22;,
    3;28, 29, 1;,
    3;29, 3, 1;,
    3;30, 28, 5;,
    3;28, 1, 5;,
    3;31, 30, 7;,
    3;30, 5, 7;,
    3;32, 31, 9;,
    3;31, 7, 9;,
    3;33, 32, 11;,
    3;32, 9, 11;,
    3;34, 33, 13;,
    3;33, 11, 13;,
    3;35, 34, 15;,
    3;34, 13, 15;,
    3;36, 35, 17;,
    3;35, 15, 17;,
    3;37, 36, 19;,
    3;36, 17, 19;,
    3;38, 37, 21;,
    3;37, 19, 21;,
    3;39, 38, 23;,
    3;38, 21, 23;,
    3;26, 27, 40;,
    3;27, 41, 40;,
    3;40, 39, 26;,
    3;39, 23, 26;,
    3;42, 43, 28;,
    3;43, 29, 28;,
    3;40, 41, 44;,
    3;41, 45, 44;,
    3;42, 28, 46;,
    3;28, 30, 46;,
    3;46, 30, 47;,
    3;30, 31, 47;,
    3;47, 31, 48;,
    3;31, 32, 48;,
    3;48, 32, 49;,
    3;32, 33, 49;,
    3;49, 33, 50;,
    3;33, 34, 50;,
    3;50, 34, 51;,
    3;34, 35, 51;,
    3;51, 35, 52;,
    3;35, 36, 52;,
    3;52, 36, 53;,
    3;36, 37, 53;,
    3;53, 37, 54;,
    3;37, 38, 54;,
    3;54, 38, 55;,
    3;38, 39, 55;,
    3;55, 39, 44;,
    3;39, 40, 44;,
    3;0, 2, 56;,
    3;2, 57, 56;,
    3;56, 58, 0;,
    3;58, 4, 0;,
    3;58, 59, 4;,
    3;59, 6, 4;,
    3;59, 60, 6;,
    3;60, 8, 6;,
    3;60, 61, 8;,
    3;61, 10, 8;,
    3;61, 62, 10;,
    3;62, 12, 10;,
    3;62, 63, 12;,
    3;63, 14, 12;,
    3;63, 64, 14;,
    3;64, 16, 14;,
    3;64, 65, 16;,
    3;65, 18, 16;,
    3;65, 66, 18;,
    3;66, 20, 18;,
    3;66, 67, 20;,
    3;67, 22, 20;,
    3;67, 68, 22;,
    3;68, 24, 22;,
    3;68, 69, 24;,
    3;69, 25, 24;,
    3;70, 71, 72;,
    3;71, 73, 72;,
    3;72, 73, 74;,
    3;73, 75, 74;,
    3;76, 77, 78;,
    3;77, 79, 78;,
    3;78, 79, 80;,
    3;79, 81, 80;,
    3;82, 83, 42;,
    3;83, 43, 42;,
    3;42, 46, 82;,
    3;46, 84, 82;,
    3;46, 47, 84;,
    3;47, 85, 84;,
    3;47, 48, 85;,
    3;48, 86, 85;,
    3;48, 49, 86;,
    3;49, 87, 86;,
    3;49, 50, 87;,
    3;50, 88, 87;,
    3;50, 51, 88;,
    3;51, 89, 88;,
    3;51, 52, 89;,
    3;52, 90, 89;,
    3;52, 53, 90;,
    3;53, 91, 90;,
    3;53, 54, 91;,
    3;54, 92, 91;,
    3;54, 55, 92;,
    3;55, 93, 92;,
    3;55, 44, 93;,
    3;44, 94, 93;,
    3;44, 45, 94;,
    3;45, 95, 94;,
    3;56, 57, 82;,
    3;57, 83, 82;,
    3;94, 95, 68;,
    3;95, 69, 68;,
    3;56, 82, 58;,
    3;82, 84, 58;,
    3;58, 84, 59;,
    3;84, 85, 59;,
    3;59, 85, 60;,
    3;85, 86, 60;,
    3;60, 86, 61;,
    3;86, 87, 61;,
    3;61, 87, 62;,
    3;87, 88, 62;,
    3;62, 88, 63;,
    3;88, 89, 63;,
    3;63, 89, 64;,
    3;89, 90, 64;,
    3;64, 90, 65;,
    3;90, 91, 65;,
    3;65, 91, 66;,
    3;91, 92, 66;,
    3;66, 92, 67;,
    3;92, 93, 67;,
    3;67, 93, 68;,
    3;93, 94, 68;;

   MeshNormals {
    96;
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    -0.577350; -0.577350; -0.577350;,
    -0.577350; -0.577350; 0.577350;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.000000; -0.707107; 0.707107;,
    0.000000; -0.707107; -0.707107;,
    0.577350; -0.577350; -0.577350;,
    0.000000; -0.707107; 0.707107;,
    0.577350; -0.577350; 0.577350;,
    0.000000; 0.294375; 0.955690;,
    -0.463571; 0.260834; 0.846799;,
    0.005235; 0.294356; 0.955681;,
    -0.003173; 0.294321; 0.955701;,
    -0.008408; 0.294327; 0.955668;,
    0.000000; 0.294375; 0.955690;,
    0.012746; 0.294264; 0.955639;,
    0.003841; 0.294243; 0.955723;,
    -0.008905; 0.294321; 0.955665;,
    0.000000; 0.294375; 0.955690;,
    0.008315; 0.294328; 0.955668;,
    0.000424; 0.294305; 0.955712;,
    0.003397; 0.294272; 0.955716;,
    0.479227; 0.258250; 0.838838;,
    0.000000; 0.883930; 0.467620;,
    -0.492347; 0.769372; 0.407016;,
    0.010183; 0.883699; 0.467945;,
    0.535799; 0.746133; 0.395229;,
    0.015716; 0.883794; 0.467613;,
    -0.009519; 0.883794; 0.467779;,
    -0.025232; 0.883579; 0.467601;,
    0.000000; 0.883930; 0.467620;,
    0.038220; 0.883126; 0.467577;,
    0.011507; 0.883636; 0.468033;,
    -0.026721; 0.883537; 0.467599;,
    0.000000; 0.883930; 0.467620;,
    0.024953; 0.883587; 0.467602;,
    0.001272; 0.883801; 0.467862;,
    0.000000; 0.294355; -0.955696;,
    -0.463568; 0.260817; -0.846805;,
    0.005235; 0.294337; -0.955687;,
    -0.003173; 0.294305; -0.955706;,
    -0.008408; 0.294311; -0.955673;,
    0.000000; 0.294355; -0.955696;,
    0.012745; 0.294244; -0.955645;,
    0.003840; 0.294227; -0.955728;,
    -0.008904; 0.294305; -0.955670;,
    0.000000; 0.294355; -0.955696;,
    0.008314; 0.294308; -0.955674;,
    0.000424; 0.294289; -0.955716;,
    0.003397; 0.294259; -0.955720;,
    0.479225; 0.258239; -0.838842;,
    0.479225; 0.258239; -0.838842;,
    0.535801; 0.746126; -0.395238;,
    0.577350; -0.577350; -0.577350;,
    0.535799; 0.746133; 0.395229;,
    0.577350; -0.577350; 0.577350;,
    0.479227; 0.258250; 0.838838;,
    -0.463568; 0.260817; -0.846805;,
    -0.577350; -0.577350; -0.577350;,
    -0.492351; 0.769361; -0.407031;,
    -0.577350; -0.577350; 0.577350;,
    -0.492347; 0.769372; 0.407016;,
    -0.463571; 0.260834; 0.846799;,
    0.000000; 0.883920; -0.467638;,
    -0.492351; 0.769361; -0.407031;,
    0.015716; 0.883784; -0.467631;,
    -0.009519; 0.883786; -0.467794;,
    -0.025232; 0.883571; -0.467616;,
    0.000000; 0.883920; -0.467638;,
    0.038220; 0.883116; -0.467595;,
    0.011507; 0.883628; -0.468048;,
    -0.026721; 0.883529; -0.467614;,
    0.000000; 0.883920; -0.467638;,
    0.024953; 0.883577; -0.467620;,
    0.001272; 0.883793; -0.467876;,
    0.010182; 0.883693; -0.467956;,
    0.535801; 0.746126; -0.395238;;
    164;
    3;0, 1, 2;,
    3;1, 3, 2;,
    3;4, 5, 0;,
    3;5, 1, 0;,
    3;6, 7, 4;,
    3;7, 5, 4;,
    3;8, 9, 6;,
    3;9, 7, 6;,
    3;10, 11, 8;,
    3;11, 9, 8;,
    3;12, 13, 10;,
    3;13, 11, 10;,
    3;14, 15, 12;,
    3;15, 13, 12;,
    3;16, 17, 14;,
    3;17, 15, 14;,
    3;18, 19, 16;,
    3;19, 17, 16;,
    3;20, 21, 18;,
    3;21, 19, 18;,
    3;22, 23, 20;,
    3;23, 21, 20;,
    3;24, 25, 26;,
    3;25, 27, 26;,
    3;24, 26, 22;,
    3;26, 23, 22;,
    3;28, 29, 1;,
    3;29, 3, 1;,
    3;30, 28, 5;,
    3;28, 1, 5;,
    3;31, 30, 7;,
    3;30, 5, 7;,
    3;32, 31, 9;,
    3;31, 7, 9;,
    3;33, 32, 11;,
    3;32, 9, 11;,
    3;34, 33, 13;,
    3;33, 11, 13;,
    3;35, 34, 15;,
    3;34, 13, 15;,
    3;36, 35, 17;,
    3;35, 15, 17;,
    3;37, 36, 19;,
    3;36, 17, 19;,
    3;38, 37, 21;,
    3;37, 19, 21;,
    3;39, 38, 23;,
    3;38, 21, 23;,
    3;26, 27, 40;,
    3;27, 41, 40;,
    3;40, 39, 26;,
    3;39, 23, 26;,
    3;42, 43, 28;,
    3;43, 29, 28;,
    3;40, 41, 44;,
    3;41, 45, 44;,
    3;42, 28, 46;,
    3;28, 30, 46;,
    3;46, 30, 47;,
    3;30, 31, 47;,
    3;47, 31, 48;,
    3;31, 32, 48;,
    3;48, 32, 49;,
    3;32, 33, 49;,
    3;49, 33, 50;,
    3;33, 34, 50;,
    3;50, 34, 51;,
    3;34, 35, 51;,
    3;51, 35, 52;,
    3;35, 36, 52;,
    3;52, 36, 53;,
    3;36, 37, 53;,
    3;53, 37, 54;,
    3;37, 38, 54;,
    3;54, 38, 55;,
    3;38, 39, 55;,
    3;55, 39, 44;,
    3;39, 40, 44;,
    3;0, 2, 56;,
    3;2, 57, 56;,
    3;56, 58, 0;,
    3;58, 4, 0;,
    3;58, 59, 4;,
    3;59, 6, 4;,
    3;59, 60, 6;,
    3;60, 8, 6;,
    3;60, 61, 8;,
    3;61, 10, 8;,
    3;61, 62, 10;,
    3;62, 12, 10;,
    3;62, 63, 12;,
    3;63, 14, 12;,
    3;63, 64, 14;,
    3;64, 16, 14;,
    3;64, 65, 16;,
    3;65, 18, 16;,
    3;65, 66, 18;,
    3;66, 20, 18;,
    3;66, 67, 20;,
    3;67, 22, 20;,
    3;67, 68, 22;,
    3;68, 24, 22;,
    3;68, 69, 24;,
    3;69, 25, 24;,
    3;70, 71, 72;,
    3;71, 73, 72;,
    3;72, 73, 74;,
    3;73, 75, 74;,
    3;76, 77, 78;,
    3;77, 79, 78;,
    3;78, 79, 80;,
    3;79, 81, 80;,
    3;82, 83, 42;,
    3;83, 43, 42;,
    3;42, 46, 82;,
    3;46, 84, 82;,
    3;46, 47, 84;,
    3;47, 85, 84;,
    3;47, 48, 85;,
    3;48, 86, 85;,
    3;48, 49, 86;,
    3;49, 87, 86;,
    3;49, 50, 87;,
    3;50, 88, 87;,
    3;50, 51, 88;,
    3;51, 89, 88;,
    3;51, 52, 89;,
    3;52, 90, 89;,
    3;52, 53, 90;,
    3;53, 91, 90;,
    3;53, 54, 91;,
    3;54, 92, 91;,
    3;54, 55, 92;,
    3;55, 93, 92;,
    3;55, 44, 93;,
    3;44, 94, 93;,
    3;44, 45, 94;,
    3;45, 95, 94;,
    3;56, 57, 82;,
    3;57, 83, 82;,
    3;94, 95, 68;,
    3;95, 69, 68;,
    3;56, 82, 58;,
    3;82, 84, 58;,
    3;58, 84, 59;,
    3;84, 85, 59;,
    3;59, 85, 60;,
    3;85, 86, 60;,
    3;60, 86, 61;,
    3;86, 87, 61;,
    3;61, 87, 62;,
    3;87, 88, 62;,
    3;62, 88, 63;,
    3;88, 89, 63;,
    3;63, 89, 64;,
    3;89, 90, 64;,
    3;64, 90, 65;,
    3;90, 91, 65;,
    3;65, 91, 66;,
    3;91, 92, 66;,
    3;66, 92, 67;,
    3;92, 93, 67;,
    3;67, 93, 68;,
    3;93, 94, 68;;
   }

   MeshTextureCoords {
    96;
    0.077750; 0.707851;,
    0.077750; 0.707851;,
    0.023445; 0.707851;,
    0.023445; 0.707851;,
    0.141531; 0.707851;,
    0.141531; 0.707851;,
    0.240010; 0.707851;,
    0.240010; 0.707851;,
    0.301311; 0.707851;,
    0.301311; 0.707851;,
    0.369769; 0.707851;,
    0.369769; 0.707851;,
    0.441780; 0.707851;,
    0.441780; 0.707851;,
    0.503389; 0.707851;,
    0.503389; 0.707851;,
    0.591616; 0.707851;,
    0.591616; 0.707851;,
    0.668411; 0.707851;,
    0.668411; 0.707851;,
    0.745066; 0.707851;,
    0.745066; 0.707851;,
    0.822308; 0.707851;,
    0.822308; 0.707851;,
    0.903706; 0.707851;,
    0.983445; 0.707851;,
    0.903706; 0.707851;,
    0.983445; 0.707851;,
    0.077750; 0.064776;,
    0.023445; 0.064776;,
    0.141531; 0.064776;,
    0.240010; 0.071783;,
    0.301311; 0.064776;,
    0.369769; 0.064776;,
    0.441780; 0.064776;,
    0.503389; 0.075457;,
    0.591616; 0.064776;,
    0.668411; 0.064776;,
    0.745066; 0.064776;,
    0.822308; 0.073507;,
    0.903706; 0.064776;,
    0.983445; 0.077016;,
    0.077750; 0.037241;,
    0.023445; 0.037241;,
    0.903706; 0.037241;,
    0.983445; 0.049481;,
    0.141531; 0.037241;,
    0.240010; 0.044248;,
    0.301311; 0.037241;,
    0.369769; 0.037241;,
    0.441780; 0.037241;,
    0.503389; 0.047922;,
    0.591616; 0.037241;,
    0.668411; 0.037241;,
    0.745066; 0.037241;,
    0.822308; 0.045972;,
    0.077750; 0.062861;,
    0.023445; 0.062861;,
    0.141531; 0.062861;,
    0.240010; 0.069866;,
    0.301311; 0.062861;,
    0.369769; 0.062861;,
    0.441780; 0.062861;,
    0.503389; 0.073540;,
    0.591616; 0.062861;,
    0.668411; 0.062861;,
    0.745066; 0.062861;,
    0.822308; 0.071590;,
    0.903706; 0.062861;,
    0.983445; 0.075099;,
    0.540064; 0.079805;,
    0.525244; 0.099373;,
    0.540064; 0.702546;,
    0.482755; 0.054592;,
    0.466826; 0.702546;,
    0.466826; 0.081692;,
    0.540064; 0.067760;,
    0.540064; 0.702546;,
    0.525244; 0.087327;,
    0.466826; 0.702546;,
    0.482755; 0.042546;,
    0.466826; 0.069645;,
    0.077750; 0.082022;,
    0.023445; 0.082022;,
    0.141531; 0.082022;,
    0.240010; 0.089029;,
    0.301311; 0.082022;,
    0.369769; 0.082022;,
    0.441780; 0.082022;,
    0.503389; 0.092703;,
    0.591616; 0.082022;,
    0.668411; 0.082022;,
    0.745066; 0.082022;,
    0.822308; 0.090753;,
    0.903706; 0.082022;,
    0.983445; 0.094262;;
   }

   MeshVertexColors {
    96;
    0; 1.000000; 1.000000; 1.000000; 1.000000;,
    1; 1.000000; 1.000000; 1.000000; 1.000000;,
    2; 1.000000; 1.000000; 1.000000; 1.000000;,
    3; 1.000000; 1.000000; 1.000000; 1.000000;,
    4; 1.000000; 1.000000; 1.000000; 1.000000;,
    5; 1.000000; 1.000000; 1.000000; 1.000000;,
    6; 1.000000; 1.000000; 1.000000; 1.000000;,
    7; 1.000000; 1.000000; 1.000000; 1.000000;,
    8; 1.000000; 1.000000; 1.000000; 1.000000;,
    9; 1.000000; 1.000000; 1.000000; 1.000000;,
    10; 1.000000; 1.000000; 1.000000; 1.000000;,
    11; 1.000000; 1.000000; 1.000000; 1.000000;,
    12; 1.000000; 1.000000; 1.000000; 1.000000;,
    13; 1.000000; 1.000000; 1.000000; 1.000000;,
    14; 1.000000; 1.000000; 1.000000; 1.000000;,
    15; 1.000000; 1.000000; 1.000000; 1.000000;,
    16; 1.000000; 1.000000; 1.000000; 1.000000;,
    17; 1.000000; 1.000000; 1.000000; 1.000000;,
    18; 1.000000; 1.000000; 1.000000; 1.000000;,
    19; 1.000000; 1.000000; 1.000000; 1.000000;,
    20; 1.000000; 1.000000; 1.000000; 1.000000;,
    21; 1.000000; 1.000000; 1.000000; 1.000000;,
    22; 1.000000; 1.000000; 1.000000; 1.000000;,
    23; 1.000000; 1.000000; 1.000000; 1.000000;,
    24; 1.000000; 1.000000; 1.000000; 1.000000;,
    25; 1.000000; 1.000000; 1.000000; 1.000000;,
    26; 1.000000; 1.000000; 1.000000; 1.000000;,
    27; 1.000000; 1.000000; 1.000000; 1.000000;,
    28; 1.000000; 1.000000; 1.000000; 1.000000;,
    29; 1.000000; 1.000000; 1.000000; 1.000000;,
    30; 1.000000; 1.000000; 1.000000; 1.000000;,
    31; 1.000000; 1.000000; 1.000000; 1.000000;,
    32; 1.000000; 1.000000; 1.000000; 1.000000;,
    33; 1.000000; 1.000000; 1.000000; 1.000000;,
    34; 1.000000; 1.000000; 1.000000; 1.000000;,
    35; 1.000000; 1.000000; 1.000000; 1.000000;,
    36; 1.000000; 1.000000; 1.000000; 1.000000;,
    37; 1.000000; 1.000000; 1.000000; 1.000000;,
    38; 1.000000; 1.000000; 1.000000; 1.000000;,
    39; 1.000000; 1.000000; 1.000000; 1.000000;,
    40; 1.000000; 1.000000; 1.000000; 1.000000;,
    41; 1.000000; 1.000000; 1.000000; 1.000000;,
    42; 1.000000; 1.000000; 1.000000; 1.000000;,
    43; 1.000000; 1.000000; 1.000000; 1.000000;,
    44; 1.000000; 1.000000; 1.000000; 1.000000;,
    45; 1.000000; 1.000000; 1.000000; 1.000000;,
    46; 1.000000; 1.000000; 1.000000; 1.000000;,
    47; 1.000000; 1.000000; 1.000000; 1.000000;,
    48; 1.000000; 1.000000; 1.000000; 1.000000;,
    49; 1.000000; 1.000000; 1.000000; 1.000000;,
    50; 1.000000; 1.000000; 1.000000; 1.000000;,
    51; 1.000000; 1.000000; 1.000000; 1.000000;,
    52; 1.000000; 1.000000; 1.000000; 1.000000;,
    53; 1.000000; 1.000000; 1.000000; 1.000000;,
    54; 1.000000; 1.000000; 1.000000; 1.000000;,
    55; 1.000000; 1.000000; 1.000000; 1.000000;,
    56; 1.000000; 1.000000; 1.000000; 1.000000;,
    57; 1.000000; 1.000000; 1.000000; 1.000000;,
    58; 1.000000; 1.000000; 1.000000; 1.000000;,
    59; 1.000000; 1.000000; 1.000000; 1.000000;,
    60; 1.000000; 1.000000; 1.000000; 1.000000;,
    61; 1.000000; 1.000000; 1.000000; 1.000000;,
    62; 1.000000; 1.000000; 1.000000; 1.000000;,
    63; 1.000000; 1.000000; 1.000000; 1.000000;,
    64; 1.000000; 1.000000; 1.000000; 1.000000;,
    65; 1.000000; 1.000000; 1.000000; 1.000000;,
    66; 1.000000; 1.000000; 1.000000; 1.000000;,
    67; 1.000000; 1.000000; 1.000000; 1.000000;,
    68; 1.000000; 1.000000; 1.000000; 1.000000;,
    69; 1.000000; 1.000000; 1.000000; 1.000000;,
    70; 1.000000; 1.000000; 1.000000; 1.000000;,
    71; 1.000000; 1.000000; 1.000000; 1.000000;,
    72; 1.000000; 1.000000; 1.000000; 1.000000;,
    73; 1.000000; 1.000000; 1.000000; 1.000000;,
    74; 1.000000; 1.000000; 1.000000; 1.000000;,
    75; 1.000000; 1.000000; 1.000000; 1.000000;,
    76; 1.000000; 1.000000; 1.000000; 1.000000;,
    77; 1.000000; 1.000000; 1.000000; 1.000000;,
    78; 1.000000; 1.000000; 1.000000; 1.000000;,
    79; 1.000000; 1.000000; 1.000000; 1.000000;,
    80; 1.000000; 1.000000; 1.000000; 1.000000;,
    81; 1.000000; 1.000000; 1.000000; 1.000000;,
    82; 1.000000; 1.000000; 1.000000; 1.000000;,
    83; 1.000000; 1.000000; 1.000000; 1.000000;,
    84; 1.000000; 1.000000; 1.000000; 1.000000;,
    85; 1.000000; 1.000000; 1.000000; 1.000000;,
    86; 1.000000; 1.000000; 1.000000; 1.000000;,
    87; 1.000000; 1.000000; 1.000000; 1.000000;,
    88; 1.000000; 1.000000; 1.000000; 1.000000;,
    89; 1.000000; 1.000000; 1.000000; 1.000000;,
    90; 1.000000; 1.000000; 1.000000; 1.000000;,
    91; 1.000000; 1.000000; 1.000000; 1.000000;,
    92; 1.000000; 1.000000; 1.000000; 1.000000;,
    93; 1.000000; 1.000000; 1.000000; 1.000000;,
    94; 1.000000; 1.000000; 1.000000; 1.000000;,
    95; 1.000000; 1.000000; 1.000000; 1.000000;;
   }

   MeshMaterialList {
    1;
    164;
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0;

    Material def_surf_mat {
     0.992157; 0.992157; 0.992157; 1.000000;;
     128.000000;
     0.150000; 0.150000; 0.150000;;
     0.000000; 0.000000; 0.000000;;

     TextureFilename {
      "oldwall.dds";
     }
    }

   }
  }
}
