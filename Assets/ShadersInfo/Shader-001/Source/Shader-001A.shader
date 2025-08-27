Shader "Kaseem/Shader-001A"
{
    Properties
    {
        // Var name - mat name - var type - RGBA colour
        _Color("ColourTest", color) = (1,1,1,1)
    }
    SubShader
    {

        // Tags ex - Transparent, Metallic, Opaque, Background
        Tags { "RenderType"="Opaque" }
        // LOD is the level of detail
        LOD 100

        // Where we're gonna play  with multiple lights.
        Pass
        {
            CGPROGRAM
            #pragma vertex vert // function with all verts.
            #pragma fragment frag // Pixel shader fragments and function in all pixels.

            // Var declarations 
            fixed4 _Color;

            // Libreries
            #include "UnityCG.cginc"

            // Have all mesh data form objects.
            struct appdata
            {
                float4 vertex : POSITION;
            };

            // suppport verts 2 frags.
            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            // once found verx pos, it modifies it.
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                /*
                float4 (135,206,250,1) // tex with high quality
                half2 (1,1); // tex with 50/50 in quality.
                fixed4 col = 1; // tex with low quiality.
                */
                fixed4 col = _Color;
                return col;
            }
            ENDCG
        }
    }
}
