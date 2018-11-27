Shader "PBR Master"
{
	Properties
	{
				Float_A6E7CF86("Speed", Float) = 0.2
				Vector2_B1B0D437("Tilling", Vector) = (0,0,0,0)
				[NoScaleOffset] Texture_71BAC8EF("Image", 2D) = "white" {}
				Float_E2DF4406("Metallic", Float) = 0
				Float_9736E1F4("Smoothness", Float) = 0.5
				Float_61B9223D("Occulusion", Float) = 1
				[NoScaleOffset] Texture_2AFFB418("Normal", 2D) = "white" {}
				Float_EB2CCD90("NormalPower", Float) = 1
				Color_505C057B("Color", Color) = (1,1,1,0)
				[NoScaleOffset] Texture_405CA61D("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags{ "RenderPipeline" = "LightweightPipeline"}
		Tags
		{
			"RenderType"="Opaque"
			"Queue"="Geometry"
		}
		Pass
		{
			Tags{"LightMode" = "LightweightForward"}
			
					Blend One Zero
					Cull Back
					ZTest LEqual
					ZWrite On
			
			CGPROGRAM
			#pragma target 3.0
			
		    #pragma multi_compile _ _MAIN_LIGHT_COOKIE
		    #pragma multi_compile _MAIN_DIRECTIONAL_LIGHT _MAIN_SPOT_LIGHT
		    #pragma multi_compile _ _ADDITIONAL_LIGHTS
		    #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
		    #pragma multi_compile _ UNITY_SINGLE_PASS_STEREO STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON
		    #pragma multi_compile _ LIGHTMAP_ON
		    #pragma multi_compile _ DIRLIGHTMAP_COMBINED
		    #pragma multi_compile _ _HARD_SHADOWS _SOFT_SHADOWS _HARD_SHADOWS_CASCADES _SOFT_SHADOWS_CASCADES
		    #pragma multi_compile _ _VERTEX_LIGHTS
		    #pragma multi_compile_fog
		    #pragma multi_compile_instancing
		    #pragma vertex vert
			#pragma fragment frag
			
			#pragma glsl
			#pragma debug
			
						#define _NORMALMAP 1
			#include "LightweightLighting.cginc"
								void Unity_Add_float(float2 A, float2 B, out float2 Out)
							{
							    Out = A + B;
							}
							void Unity_Multiply_float(float A, float B, out float Out)
							{
							    Out = A * B;
							}
							void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA)
							{
							    RGBA = float4(R, G, B, A);
							}
							void Unity_Multiply_float(float4 A, float4 B, out float4 Out)
							{
							    Out = A * B;
							}
							void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
							{
							    Out = UV * Tiling + Offset;
							}
							void Unity_Rotate_Radians_float(float2 UV, float2 Center, float Rotation, out float2 Out)
							{
							    //rotation matrix
							    UV -= Center;
							    float s = sin(Rotation);
							    float c = cos(Rotation);
							    //center rotation matrix
							    float2x2 rMatrix = float2x2(c, -s, s, c);
							    rMatrix *= 0.5;
							    rMatrix += 0.5;
							    rMatrix = rMatrix*2 - 1;
							    //multiply the UVs by the rotation matrix
							    UV.xy = mul(UV.xy, rMatrix);
							    UV += Center;
							    Out = UV;
							}
							void Unity_Add_float(float4 A, float4 B, out float4 Out)
							{
							    Out = A + B;
							}
							void Unity_Preview_float(float4 In, out float4 Out)
							{
							    Out = In;
							}
							void Unity_OneMinus_float(float4 In, out float4 Out)
							{
							    Out = 1 - In;
							}
							void Unity_Power_float(float4 A, float4 B, out float4 Out)
							{
							    Out = pow(A, B);
							}
							void Unity_Clamp_float(float4 In, float4 Min, float4 Max, out float4 Out)
							{
							    Out = clamp(In, Min, Max);
							}
							void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
							{
							    Out = float3(In.rg * Strength, 1);
							}
							struct GraphVertexInput
							{
								float4 vertex : POSITION;
								float3 normal : NORMAL;
								float4 tangent : TANGENT;
								float4 texcoord0 : TEXCOORD0;
								float4 texcoord1 : TEXCOORD1;
								UNITY_VERTEX_INPUT_INSTANCE_ID
							};
							struct SurfaceInputs{
								half4 uv0;
							};
							struct SurfaceDescription{
								float3 Albedo;
								float3 Normal;
								float3 Emission;
								float Metallic;
								float Smoothness;
								float Occlusion;
								float Alpha;
							};
							float Float_A6E7CF86;
							float4 Vector2_B1B0D437;
							UNITY_DECLARE_TEX2D(Texture_71BAC8EF);
							float Float_E2DF4406;
							float Float_9736E1F4;
							float Float_61B9223D;
							UNITY_DECLARE_TEX2D(Texture_2AFFB418);
							float Float_EB2CCD90;
							float4 Color_505C057B;
							UNITY_DECLARE_TEX2D(Texture_405CA61D);
							float4 _Add_3D251047_B;
							float _Combine_C1838124_B;
							float _Combine_C1838124_A;
							float4 _Multiply_597E1E6E_B;
							float4 _TilingAndOffset_DA51A6E0_UV;
							float4 _Rotate_9B331C60_Center;
							float _Rotate_9B331C60_Rotation;
							float4 _Add_C6D94697_B;
							float4 _Multiply_3B1C36CC_B;
							float4 _TilingAndOffset_8CBE9564_UV;
							float4 _Rotate_40DA02FF_Center;
							float _Rotate_40DA02FF_Rotation;
							float4 _Add_3E859C3A_B;
							float4 _Multiply_939E0B92_B;
							float4 _TilingAndOffset_CEDA7F4C_UV;
							float4 _Rotate_E33D1A35_Center;
							float _Rotate_E33D1A35_Rotation;
							float4 _Multiply_F24F7723_B;
							float4 _TilingAndOffset_7C27A56D_UV;
							float4 _Rotate_B9D55D88_Center;
							float _Rotate_B9D55D88_Rotation;
							float4 _Multiply_1DD20C03_B;
							float4 _TilingAndOffset_48B7D83C_UV;
							float4 _Rotate_C4379400_Center;
							float _Rotate_C4379400_Rotation;
							float4 _Clamp_BDAA3814_Min;
							float4 _Clamp_BDAA3814_Max;
							float4 _TilingAndOffset_7EAA610A_UV;
							float4 _TilingAndOffset_7EAA610A_Offset;
							float4 _PBRMaster_B01F926_Emission;
							float _PBRMaster_B01F926_Alpha;
							GraphVertexInput PopulateVertexData(GraphVertexInput v){
								return v;
							}
							SurfaceDescription PopulateSurfaceData(SurfaceInputs IN) {
								SurfaceDescription surface = (SurfaceDescription)0;
								half4 uv0 = IN.uv0;
								float2 _Property_3049E5C8_Out = Vector2_B1B0D437;
								float2 _Add_3D251047_Out;
								Unity_Add_float(_Property_3049E5C8_Out, _Add_3D251047_B, _Add_3D251047_Out);
								float _Property_8972091C_Out = Float_A6E7CF86;
								float _Multiply_F23A1A8C_Out;
								Unity_Multiply_float(_Time.y, _Property_8972091C_Out, _Multiply_F23A1A8C_Out);
								float4 _Combine_C1838124_RGBA;
								Unity_Combine_float(_Multiply_F23A1A8C_Out, _Multiply_F23A1A8C_Out, _Combine_C1838124_B, _Combine_C1838124_A, _Combine_C1838124_RGBA);
								float4 _Multiply_597E1E6E_Out;
								Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_597E1E6E_B, _Multiply_597E1E6E_Out);
								float2 _TilingAndOffset_DA51A6E0_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Add_3D251047_Out, (_Multiply_597E1E6E_Out.xy), _TilingAndOffset_DA51A6E0_Out);
								float2 _Rotate_9B331C60_Out;
								Unity_Rotate_Radians_float(_TilingAndOffset_DA51A6E0_Out, _Rotate_9B331C60_Center, _Rotate_9B331C60_Rotation, _Rotate_9B331C60_Out);
								float4 _SampleTexture2D_8E651293_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_9B331C60_Out);
								float _SampleTexture2D_8E651293_R = _SampleTexture2D_8E651293_RGBA.r;
								float _SampleTexture2D_8E651293_G = _SampleTexture2D_8E651293_RGBA.g;
								float _SampleTexture2D_8E651293_B = _SampleTexture2D_8E651293_RGBA.b;
								float _SampleTexture2D_8E651293_A = _SampleTexture2D_8E651293_RGBA.a;
								float2 _Add_C6D94697_Out;
								Unity_Add_float(_Property_3049E5C8_Out, _Add_C6D94697_B, _Add_C6D94697_Out);
								float4 _Multiply_3B1C36CC_Out;
								Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_3B1C36CC_B, _Multiply_3B1C36CC_Out);
								float2 _TilingAndOffset_8CBE9564_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Add_C6D94697_Out, (_Multiply_3B1C36CC_Out.xy), _TilingAndOffset_8CBE9564_Out);
								float2 _Rotate_40DA02FF_Out;
								Unity_Rotate_Radians_float(_TilingAndOffset_8CBE9564_Out, _Rotate_40DA02FF_Center, _Rotate_40DA02FF_Rotation, _Rotate_40DA02FF_Out);
								float4 _SampleTexture2D_FD3A99DF_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_40DA02FF_Out);
								float _SampleTexture2D_FD3A99DF_R = _SampleTexture2D_FD3A99DF_RGBA.r;
								float _SampleTexture2D_FD3A99DF_G = _SampleTexture2D_FD3A99DF_RGBA.g;
								float _SampleTexture2D_FD3A99DF_B = _SampleTexture2D_FD3A99DF_RGBA.b;
								float _SampleTexture2D_FD3A99DF_A = _SampleTexture2D_FD3A99DF_RGBA.a;
								float4 _Add_D3AA546_Out;
								Unity_Add_float(_SampleTexture2D_8E651293_RGBA, _SampleTexture2D_FD3A99DF_RGBA, _Add_D3AA546_Out);
								float2 _Add_3E859C3A_Out;
								Unity_Add_float(_Property_3049E5C8_Out, _Add_3E859C3A_B, _Add_3E859C3A_Out);
								float4 _Multiply_939E0B92_Out;
								Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_939E0B92_B, _Multiply_939E0B92_Out);
								float2 _TilingAndOffset_CEDA7F4C_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_939E0B92_Out.xy), _TilingAndOffset_CEDA7F4C_Out);
								float2 _Rotate_E33D1A35_Out;
								Unity_Rotate_Radians_float(_TilingAndOffset_CEDA7F4C_Out, _Rotate_E33D1A35_Center, _Rotate_E33D1A35_Rotation, _Rotate_E33D1A35_Out);
								float4 _SampleTexture2D_A0734840_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_E33D1A35_Out);
								float _SampleTexture2D_A0734840_R = _SampleTexture2D_A0734840_RGBA.r;
								float _SampleTexture2D_A0734840_G = _SampleTexture2D_A0734840_RGBA.g;
								float _SampleTexture2D_A0734840_B = _SampleTexture2D_A0734840_RGBA.b;
								float _SampleTexture2D_A0734840_A = _SampleTexture2D_A0734840_RGBA.a;
								float4 _Add_A6E086EF_Out;
								Unity_Add_float(_Add_D3AA546_Out, _SampleTexture2D_A0734840_RGBA, _Add_A6E086EF_Out);
								float4 _Multiply_F24F7723_Out;
								Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_F24F7723_B, _Multiply_F24F7723_Out);
								float2 _TilingAndOffset_7C27A56D_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_F24F7723_Out.xy), _TilingAndOffset_7C27A56D_Out);
								float2 _Rotate_B9D55D88_Out;
								Unity_Rotate_Radians_float(_TilingAndOffset_7C27A56D_Out, _Rotate_B9D55D88_Center, _Rotate_B9D55D88_Rotation, _Rotate_B9D55D88_Out);
								float4 _SampleTexture2D_96E63C9C_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_B9D55D88_Out);
								float _SampleTexture2D_96E63C9C_R = _SampleTexture2D_96E63C9C_RGBA.r;
								float _SampleTexture2D_96E63C9C_G = _SampleTexture2D_96E63C9C_RGBA.g;
								float _SampleTexture2D_96E63C9C_B = _SampleTexture2D_96E63C9C_RGBA.b;
								float _SampleTexture2D_96E63C9C_A = _SampleTexture2D_96E63C9C_RGBA.a;
								float4 _Add_744F92CF_Out;
								Unity_Add_float(_Add_A6E086EF_Out, _SampleTexture2D_96E63C9C_RGBA, _Add_744F92CF_Out);
								float4 _Multiply_1DD20C03_Out;
								Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_1DD20C03_B, _Multiply_1DD20C03_Out);
								float2 _TilingAndOffset_48B7D83C_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_1DD20C03_Out.xy), _TilingAndOffset_48B7D83C_Out);
								float2 _Rotate_C4379400_Out;
								Unity_Rotate_Radians_float(_TilingAndOffset_48B7D83C_Out, _Rotate_C4379400_Center, _Rotate_C4379400_Rotation, _Rotate_C4379400_Out);
								float4 _SampleTexture2D_1B6152CE_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_C4379400_Out);
								float _SampleTexture2D_1B6152CE_R = _SampleTexture2D_1B6152CE_RGBA.r;
								float _SampleTexture2D_1B6152CE_G = _SampleTexture2D_1B6152CE_RGBA.g;
								float _SampleTexture2D_1B6152CE_B = _SampleTexture2D_1B6152CE_RGBA.b;
								float _SampleTexture2D_1B6152CE_A = _SampleTexture2D_1B6152CE_RGBA.a;
								float4 _Add_F6738658_Out;
								Unity_Add_float(_Add_744F92CF_Out, _SampleTexture2D_1B6152CE_RGBA, _Add_F6738658_Out);
								float4 _Preview_84C2280D_Out;
								Unity_Preview_float(_Add_F6738658_Out, _Preview_84C2280D_Out);
								float4 _OneMinus_F4633EE7_Out;
								Unity_OneMinus_float(_Preview_84C2280D_Out, _OneMinus_F4633EE7_Out);
								float4 _Power_11477883_Out;
								Unity_Power_float(_Preview_84C2280D_Out, _OneMinus_F4633EE7_Out, _Power_11477883_Out);
								float4 _OneMinus_DDC6E182_Out;
								Unity_OneMinus_float(_Power_11477883_Out, _OneMinus_DDC6E182_Out);
								float4 _Clamp_BDAA3814_Out;
								Unity_Clamp_float(_OneMinus_DDC6E182_Out, _Clamp_BDAA3814_Min, _Clamp_BDAA3814_Max, _Clamp_BDAA3814_Out);
								float4 _Property_4713334B_Out = Color_505C057B;
								float4 _Multiply_F4F39E27_Out;
								Unity_Multiply_float(_Clamp_BDAA3814_Out, _Property_4713334B_Out, _Multiply_F4F39E27_Out);
								float2 _Property_BD85E76_Out = Vector2_B1B0D437;
								float2 _TilingAndOffset_7EAA610A_Out;
								Unity_TilingAndOffset_float(uv0.xy, _Property_BD85E76_Out, _TilingAndOffset_7EAA610A_Offset, _TilingAndOffset_7EAA610A_Out);
								float4 _SampleTexture2D_91CADF20_RGBA = UNITY_SAMPLE_TEX2D(Texture_405CA61D,_TilingAndOffset_7EAA610A_Out);
								float _SampleTexture2D_91CADF20_R = _SampleTexture2D_91CADF20_RGBA.r;
								float _SampleTexture2D_91CADF20_G = _SampleTexture2D_91CADF20_RGBA.g;
								float _SampleTexture2D_91CADF20_B = _SampleTexture2D_91CADF20_RGBA.b;
								float _SampleTexture2D_91CADF20_A = _SampleTexture2D_91CADF20_RGBA.a;
								float4 _Multiply_CEBCAFF4_Out;
								Unity_Multiply_float(_Multiply_F4F39E27_Out, _SampleTexture2D_91CADF20_RGBA, _Multiply_CEBCAFF4_Out);
								float4 _SampleTexture2D_494B731A_RGBA = UNITY_SAMPLE_TEX2D(Texture_2AFFB418,_TilingAndOffset_7EAA610A_Out);
								_SampleTexture2D_494B731A_RGBA.rgb = UnpackNormal(_SampleTexture2D_494B731A_RGBA);
								float _SampleTexture2D_494B731A_R = _SampleTexture2D_494B731A_RGBA.r;
								float _SampleTexture2D_494B731A_G = _SampleTexture2D_494B731A_RGBA.g;
								float _SampleTexture2D_494B731A_B = _SampleTexture2D_494B731A_RGBA.b;
								float _SampleTexture2D_494B731A_A = _SampleTexture2D_494B731A_RGBA.a;
								float _Property_EC4176F_Out = Float_EB2CCD90;
								float3 _NormalStrength_346D7681_Out;
								Unity_NormalStrength_float((_SampleTexture2D_494B731A_RGBA.xyz), _Property_EC4176F_Out, _NormalStrength_346D7681_Out);
								float _Property_FBE1886A_Out = Float_E2DF4406;
								float _Property_987113B4_Out = Float_9736E1F4;
								float _Property_90501703_Out = Float_61B9223D;
								surface.Albedo = _Multiply_CEBCAFF4_Out;
								surface.Normal = _NormalStrength_346D7681_Out;
								surface.Emission = _PBRMaster_B01F926_Emission;
								surface.Metallic = _Property_FBE1886A_Out;
								surface.Smoothness = _Property_987113B4_Out;
								surface.Occlusion = _Property_90501703_Out;
								surface.Alpha = _PBRMaster_B01F926_Alpha;
								return surface;
							}
			
			struct GraphVertexOutput
		    {
		        float4 position : SV_POSITION;
		#ifdef LIGHTMAP_ON
		        float4 lightmapUV : TEXCOORD0;
		#else
				float4 vertexSH : TEXCOORD0;
		#endif
				half4 fogFactorAndVertexLight : TEXCOORD1; // x: fogFactor, yzw: vertex light
		        			float3 WorldSpaceNormal : TEXCOORD3;
					float3 WorldSpaceTangent : TEXCOORD4;
					float3 WorldSpaceBiTangent : TEXCOORD5;
					float3 WorldSpaceViewDirection : TEXCOORD6;
					float3 WorldSpacePosition : TEXCOORD7;
					half4 uv0 : TEXCOORD8;
					half4 uv1 : TEXCOORD9;
				UNITY_VERTEX_OUTPUT_STEREO
		    };
			
		    GraphVertexOutput vert (GraphVertexInput v)
			{
			    v = PopulateVertexData(v);
				
				UNITY_SETUP_INSTANCE_ID(v);
		        GraphVertexOutput o = (GraphVertexOutput)0;
		        UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		        			o.WorldSpaceNormal = mul(v.normal,(float3x3)unity_WorldToObject);
					o.WorldSpaceTangent = mul((float3x3)unity_ObjectToWorld,v.tangent);
					o.WorldSpaceBiTangent = normalize(cross(o.WorldSpaceNormal, o.WorldSpaceTangent.xyz) * v.tangent.w);
					o.WorldSpaceViewDirection = mul((float3x3)unity_ObjectToWorld,ObjSpaceViewDir(v.vertex));
					o.WorldSpacePosition = mul(unity_ObjectToWorld,v.vertex);
					o.uv0 = v.texcoord0;
					o.uv1 = v.texcoord1;
				float3 lwWNormal = normalize(UnityObjectToWorldNormal(v.normal));
				float4 lwWorldPos = mul(unity_ObjectToWorld, v.vertex);
				float4 clipPos = mul(UNITY_MATRIX_VP, lwWorldPos);
		#ifdef LIGHTMAP_ON
				o.lightmapUV.zw = v.texcoord1 * unity_LightmapST.xy + unity_LightmapST.zw;
		#else
				o.vertexSH = half4(EvaluateSHPerVertex(lwWNormal), 0.0);
		#endif
				o.fogFactorAndVertexLight.yzw = VertexLighting(lwWorldPos.xyz, lwWNormal);
				o.fogFactorAndVertexLight.x = ComputeFogFactor(clipPos.z);
		        o.position = clipPos;
				return o;
			}
			fixed4 frag (GraphVertexOutput IN) : SV_Target
		    {
		    				float3 WorldSpaceNormal = normalize(IN.WorldSpaceNormal);
					float3 WorldSpaceTangent = IN.WorldSpaceTangent;
					float3 WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
					float3 WorldSpaceViewDirection = normalize(IN.WorldSpaceViewDirection);
					float3 WorldSpacePosition = IN.WorldSpacePosition;
					float4 uv0  = IN.uv0;
					float4 uv1  = IN.uv1;
		        SurfaceInputs surfaceInput = (SurfaceInputs)0;
		        			surfaceInput.uv0 = uv0;
		        SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
				float3 Albedo = float3(0.5, 0.5, 0.5);
				float3 Specular = float3(0, 0, 0);
				float Metallic = 0;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = 1;
		        			Albedo = surf.Albedo;
					Normal = surf.Normal;
					Emission = surf.Emission;
					Metallic = surf.Metallic;
					Smoothness = surf.Smoothness;
					Occlusion = surf.Occlusion;
					Alpha = surf.Alpha;
		#if defined(UNITY_COLORSPACE_GAMMA) 
		       	Albedo = Albedo * Albedo;
		       	Emission = Emission * Emission;
		#endif
		#if _NORMALMAP
		    half3 normalWS = TangentToWorldNormal(Normal, WorldSpaceTangent, WorldSpaceBiTangent, WorldSpaceNormal);
		#else
		    half3 normalWS = normalize(WorldSpaceNormal);
		#endif
		#if LIGHTMAP_ON
			half3 indirectDiffuse = SampleLightmap(IN.lightmapUV.zw, normalWS);
		#else
			half3 indirectDiffuse = EvaluateSHPerPixel(normalWS, IN.vertexSH);
		#endif
			half4 color = LightweightFragmentPBR(
					WorldSpacePosition,
					normalWS,
					WorldSpaceViewDirection,
					indirectDiffuse,
					IN.fogFactorAndVertexLight.yzw, 
					Albedo,
					Metallic,
					Specular,
					Smoothness,
					Occlusion,
					Emission,
					Alpha);
			// Computes fog factor per-vertex
		    ApplyFog(color.rgb, IN.fogFactorAndVertexLight.x);
		#if _AlphaOut
				color.a = Alpha;
		#else
				color.a = 1;
		#endif
		#if _AlphaClip
				clip(Alpha - 0.01);
		#endif
				return color;
		    }
			ENDCG
		}
		Pass
		{
		    Tags{"LightMode" = "ShadowCaster"}
		    ZWrite On ZTest LEqual
		    CGPROGRAM
		    #pragma target 2.0
		    #pragma vertex ShadowPassVertex
		    #pragma fragment ShadowPassFragment
		    #include "UnityCG.cginc"
		    #include "LightweightPassShadow.cginc"
		    ENDCG
		}
		Pass
		{
		    Tags{"LightMode" = "DepthOnly"}
		    ZWrite On
		    ColorMask 0
		    CGPROGRAM
		    #pragma target 2.0
		    #pragma vertex vert
		    #pragma fragment frag
		    #include "UnityCG.cginc"
		    float4 vert(float4 pos : POSITION) : SV_POSITION
		    {
		        return UnityObjectToClipPos(pos);
		    }
		    half4 frag() : SV_TARGET
		    {
		        return 0;
		    }
		    ENDCG
		}
	}
}
