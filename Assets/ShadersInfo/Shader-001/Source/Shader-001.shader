Shader "Kaseem/Shader-001" // Folder + shaderName.
{
    Properties // var.
    {
        _Color("TestColor", Color) = (0.53, 0.81, 0.98, 0.5) // LightSkyBlue
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 100 // Details, max value is 100.

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha // Mezcla basada en alpha

            CGPROGRAM
            #pragma vertex vert // Vertex.
            #pragma fragment frag // just a face in a mesh.

            #include "UnityCG.cginc" // Libreries.

            struct appdata // Here are all data for the mesh to function.
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0; // Def Tex
            };

            struct v2f // Who gives support for vertex.
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            fixed4 _Color;

            v2f vert (appdata v) // where u pin the tex to a vertex.
            {
                // "o" = Out
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target // Colour.
            {
                /*
                float4 (135,206,250,1) // tex with high quality
                half2 (1,1); // tex with 50/50 in quality.
                fixed4 col = 1; // tex with low quiality.
                */
                return _Color;
            }
            ENDCG
        }
    }
}
