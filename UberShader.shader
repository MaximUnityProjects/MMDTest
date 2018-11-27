Shader "hidden/preview"
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
	CGINCLUDE
	#include "UnityCG.cginc"
			void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
			{
			    Out = UV * Tiling + Offset;
			}
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct SurfaceInputs{
				half4 uv0;
			};
			struct SurfaceDescription{
				float4 PreviewOutput;
			};
			float Float_3A075C8B;
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
			float4 _TilingAndOffset_7EAA610A_UV;
			float4 _TilingAndOffset_7EAA610A_Offset;
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
			GraphVertexInput PopulateVertexData(GraphVertexInput v){
				return v;
			}
			SurfaceDescription PopulateSurfaceData(SurfaceInputs IN) {
				SurfaceDescription surface = (SurfaceDescription)0;
				half4 uv0 = IN.uv0;
				float2 _Property_BD85E76_Out = Vector2_B1B0D437;
				float2 _TilingAndOffset_7EAA610A_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Property_BD85E76_Out, _TilingAndOffset_7EAA610A_Offset, _TilingAndOffset_7EAA610A_Out);
				if (Float_3A075C8B == 0) { surface.PreviewOutput = half4(_TilingAndOffset_7EAA610A_Out.x, _TilingAndOffset_7EAA610A_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_91CADF20_RGBA = UNITY_SAMPLE_TEX2D(Texture_405CA61D,_TilingAndOffset_7EAA610A_Out);
				float _SampleTexture2D_91CADF20_R = _SampleTexture2D_91CADF20_RGBA.r;
				float _SampleTexture2D_91CADF20_G = _SampleTexture2D_91CADF20_RGBA.g;
				float _SampleTexture2D_91CADF20_B = _SampleTexture2D_91CADF20_RGBA.b;
				float _SampleTexture2D_91CADF20_A = _SampleTexture2D_91CADF20_RGBA.a;
				if (Float_3A075C8B == 1) { surface.PreviewOutput = half4(_SampleTexture2D_91CADF20_RGBA.x, _SampleTexture2D_91CADF20_RGBA.y, _SampleTexture2D_91CADF20_RGBA.z, 1.0); return surface; }
				float2 _Property_3049E5C8_Out = Vector2_B1B0D437;
				float2 _Add_3D251047_Out;
				Unity_Add_float(_Property_3049E5C8_Out, _Add_3D251047_B, _Add_3D251047_Out);
				if (Float_3A075C8B == 2) { surface.PreviewOutput = half4(_Add_3D251047_Out.x, _Add_3D251047_Out.y, 0.0, 1.0); return surface; }
				float _Property_8972091C_Out = Float_A6E7CF86;
				float _Multiply_F23A1A8C_Out;
				Unity_Multiply_float(_Time.y, _Property_8972091C_Out, _Multiply_F23A1A8C_Out);
				if (Float_3A075C8B == 3) { surface.PreviewOutput = half4(_Multiply_F23A1A8C_Out, _Multiply_F23A1A8C_Out, _Multiply_F23A1A8C_Out, 1.0); return surface; }
				float4 _Combine_C1838124_RGBA;
				Unity_Combine_float(_Multiply_F23A1A8C_Out, _Multiply_F23A1A8C_Out, _Combine_C1838124_B, _Combine_C1838124_A, _Combine_C1838124_RGBA);
				if (Float_3A075C8B == 4) { surface.PreviewOutput = half4(_Combine_C1838124_RGBA.x, _Combine_C1838124_RGBA.y, _Combine_C1838124_RGBA.z, 1.0); return surface; }
				float4 _Multiply_597E1E6E_Out;
				Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_597E1E6E_B, _Multiply_597E1E6E_Out);
				if (Float_3A075C8B == 5) { surface.PreviewOutput = half4(_Multiply_597E1E6E_Out.x, _Multiply_597E1E6E_Out.y, _Multiply_597E1E6E_Out.z, 1.0); return surface; }
				float2 _TilingAndOffset_DA51A6E0_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Add_3D251047_Out, (_Multiply_597E1E6E_Out.xy), _TilingAndOffset_DA51A6E0_Out);
				if (Float_3A075C8B == 6) { surface.PreviewOutput = half4(_TilingAndOffset_DA51A6E0_Out.x, _TilingAndOffset_DA51A6E0_Out.y, 0.0, 1.0); return surface; }
				float2 _Rotate_9B331C60_Out;
				Unity_Rotate_Radians_float(_TilingAndOffset_DA51A6E0_Out, _Rotate_9B331C60_Center, _Rotate_9B331C60_Rotation, _Rotate_9B331C60_Out);
				if (Float_3A075C8B == 7) { surface.PreviewOutput = half4(_Rotate_9B331C60_Out.x, _Rotate_9B331C60_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_8E651293_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_9B331C60_Out);
				float _SampleTexture2D_8E651293_R = _SampleTexture2D_8E651293_RGBA.r;
				float _SampleTexture2D_8E651293_G = _SampleTexture2D_8E651293_RGBA.g;
				float _SampleTexture2D_8E651293_B = _SampleTexture2D_8E651293_RGBA.b;
				float _SampleTexture2D_8E651293_A = _SampleTexture2D_8E651293_RGBA.a;
				if (Float_3A075C8B == 8) { surface.PreviewOutput = half4(_SampleTexture2D_8E651293_RGBA.x, _SampleTexture2D_8E651293_RGBA.y, _SampleTexture2D_8E651293_RGBA.z, 1.0); return surface; }
				float2 _Add_C6D94697_Out;
				Unity_Add_float(_Property_3049E5C8_Out, _Add_C6D94697_B, _Add_C6D94697_Out);
				if (Float_3A075C8B == 9) { surface.PreviewOutput = half4(_Add_C6D94697_Out.x, _Add_C6D94697_Out.y, 0.0, 1.0); return surface; }
				float4 _Multiply_3B1C36CC_Out;
				Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_3B1C36CC_B, _Multiply_3B1C36CC_Out);
				if (Float_3A075C8B == 10) { surface.PreviewOutput = half4(_Multiply_3B1C36CC_Out.x, _Multiply_3B1C36CC_Out.y, _Multiply_3B1C36CC_Out.z, 1.0); return surface; }
				float2 _TilingAndOffset_8CBE9564_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Add_C6D94697_Out, (_Multiply_3B1C36CC_Out.xy), _TilingAndOffset_8CBE9564_Out);
				if (Float_3A075C8B == 11) { surface.PreviewOutput = half4(_TilingAndOffset_8CBE9564_Out.x, _TilingAndOffset_8CBE9564_Out.y, 0.0, 1.0); return surface; }
				float2 _Rotate_40DA02FF_Out;
				Unity_Rotate_Radians_float(_TilingAndOffset_8CBE9564_Out, _Rotate_40DA02FF_Center, _Rotate_40DA02FF_Rotation, _Rotate_40DA02FF_Out);
				if (Float_3A075C8B == 12) { surface.PreviewOutput = half4(_Rotate_40DA02FF_Out.x, _Rotate_40DA02FF_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_FD3A99DF_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_40DA02FF_Out);
				float _SampleTexture2D_FD3A99DF_R = _SampleTexture2D_FD3A99DF_RGBA.r;
				float _SampleTexture2D_FD3A99DF_G = _SampleTexture2D_FD3A99DF_RGBA.g;
				float _SampleTexture2D_FD3A99DF_B = _SampleTexture2D_FD3A99DF_RGBA.b;
				float _SampleTexture2D_FD3A99DF_A = _SampleTexture2D_FD3A99DF_RGBA.a;
				if (Float_3A075C8B == 13) { surface.PreviewOutput = half4(_SampleTexture2D_FD3A99DF_RGBA.x, _SampleTexture2D_FD3A99DF_RGBA.y, _SampleTexture2D_FD3A99DF_RGBA.z, 1.0); return surface; }
				float4 _Add_D3AA546_Out;
				Unity_Add_float(_SampleTexture2D_8E651293_RGBA, _SampleTexture2D_FD3A99DF_RGBA, _Add_D3AA546_Out);
				if (Float_3A075C8B == 14) { surface.PreviewOutput = half4(_Add_D3AA546_Out.x, _Add_D3AA546_Out.y, _Add_D3AA546_Out.z, 1.0); return surface; }
				float2 _Add_3E859C3A_Out;
				Unity_Add_float(_Property_3049E5C8_Out, _Add_3E859C3A_B, _Add_3E859C3A_Out);
				if (Float_3A075C8B == 15) { surface.PreviewOutput = half4(_Add_3E859C3A_Out.x, _Add_3E859C3A_Out.y, 0.0, 1.0); return surface; }
				float4 _Multiply_939E0B92_Out;
				Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_939E0B92_B, _Multiply_939E0B92_Out);
				if (Float_3A075C8B == 16) { surface.PreviewOutput = half4(_Multiply_939E0B92_Out.x, _Multiply_939E0B92_Out.y, _Multiply_939E0B92_Out.z, 1.0); return surface; }
				float2 _TilingAndOffset_CEDA7F4C_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_939E0B92_Out.xy), _TilingAndOffset_CEDA7F4C_Out);
				if (Float_3A075C8B == 17) { surface.PreviewOutput = half4(_TilingAndOffset_CEDA7F4C_Out.x, _TilingAndOffset_CEDA7F4C_Out.y, 0.0, 1.0); return surface; }
				float2 _Rotate_E33D1A35_Out;
				Unity_Rotate_Radians_float(_TilingAndOffset_CEDA7F4C_Out, _Rotate_E33D1A35_Center, _Rotate_E33D1A35_Rotation, _Rotate_E33D1A35_Out);
				if (Float_3A075C8B == 18) { surface.PreviewOutput = half4(_Rotate_E33D1A35_Out.x, _Rotate_E33D1A35_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_A0734840_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_E33D1A35_Out);
				float _SampleTexture2D_A0734840_R = _SampleTexture2D_A0734840_RGBA.r;
				float _SampleTexture2D_A0734840_G = _SampleTexture2D_A0734840_RGBA.g;
				float _SampleTexture2D_A0734840_B = _SampleTexture2D_A0734840_RGBA.b;
				float _SampleTexture2D_A0734840_A = _SampleTexture2D_A0734840_RGBA.a;
				if (Float_3A075C8B == 19) { surface.PreviewOutput = half4(_SampleTexture2D_A0734840_RGBA.x, _SampleTexture2D_A0734840_RGBA.y, _SampleTexture2D_A0734840_RGBA.z, 1.0); return surface; }
				float4 _Add_A6E086EF_Out;
				Unity_Add_float(_Add_D3AA546_Out, _SampleTexture2D_A0734840_RGBA, _Add_A6E086EF_Out);
				if (Float_3A075C8B == 20) { surface.PreviewOutput = half4(_Add_A6E086EF_Out.x, _Add_A6E086EF_Out.y, _Add_A6E086EF_Out.z, 1.0); return surface; }
				float4 _Multiply_F24F7723_Out;
				Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_F24F7723_B, _Multiply_F24F7723_Out);
				if (Float_3A075C8B == 21) { surface.PreviewOutput = half4(_Multiply_F24F7723_Out.x, _Multiply_F24F7723_Out.y, _Multiply_F24F7723_Out.z, 1.0); return surface; }
				float2 _TilingAndOffset_7C27A56D_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_F24F7723_Out.xy), _TilingAndOffset_7C27A56D_Out);
				if (Float_3A075C8B == 22) { surface.PreviewOutput = half4(_TilingAndOffset_7C27A56D_Out.x, _TilingAndOffset_7C27A56D_Out.y, 0.0, 1.0); return surface; }
				float2 _Rotate_B9D55D88_Out;
				Unity_Rotate_Radians_float(_TilingAndOffset_7C27A56D_Out, _Rotate_B9D55D88_Center, _Rotate_B9D55D88_Rotation, _Rotate_B9D55D88_Out);
				if (Float_3A075C8B == 23) { surface.PreviewOutput = half4(_Rotate_B9D55D88_Out.x, _Rotate_B9D55D88_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_96E63C9C_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_B9D55D88_Out);
				float _SampleTexture2D_96E63C9C_R = _SampleTexture2D_96E63C9C_RGBA.r;
				float _SampleTexture2D_96E63C9C_G = _SampleTexture2D_96E63C9C_RGBA.g;
				float _SampleTexture2D_96E63C9C_B = _SampleTexture2D_96E63C9C_RGBA.b;
				float _SampleTexture2D_96E63C9C_A = _SampleTexture2D_96E63C9C_RGBA.a;
				if (Float_3A075C8B == 24) { surface.PreviewOutput = half4(_SampleTexture2D_96E63C9C_RGBA.x, _SampleTexture2D_96E63C9C_RGBA.y, _SampleTexture2D_96E63C9C_RGBA.z, 1.0); return surface; }
				float4 _Add_744F92CF_Out;
				Unity_Add_float(_Add_A6E086EF_Out, _SampleTexture2D_96E63C9C_RGBA, _Add_744F92CF_Out);
				if (Float_3A075C8B == 25) { surface.PreviewOutput = half4(_Add_744F92CF_Out.x, _Add_744F92CF_Out.y, _Add_744F92CF_Out.z, 1.0); return surface; }
				float4 _Multiply_1DD20C03_Out;
				Unity_Multiply_float(_Combine_C1838124_RGBA, _Multiply_1DD20C03_B, _Multiply_1DD20C03_Out);
				if (Float_3A075C8B == 26) { surface.PreviewOutput = half4(_Multiply_1DD20C03_Out.x, _Multiply_1DD20C03_Out.y, _Multiply_1DD20C03_Out.z, 1.0); return surface; }
				float2 _TilingAndOffset_48B7D83C_Out;
				Unity_TilingAndOffset_float(uv0.xy, _Add_3E859C3A_Out, (_Multiply_1DD20C03_Out.xy), _TilingAndOffset_48B7D83C_Out);
				if (Float_3A075C8B == 27) { surface.PreviewOutput = half4(_TilingAndOffset_48B7D83C_Out.x, _TilingAndOffset_48B7D83C_Out.y, 0.0, 1.0); return surface; }
				float2 _Rotate_C4379400_Out;
				Unity_Rotate_Radians_float(_TilingAndOffset_48B7D83C_Out, _Rotate_C4379400_Center, _Rotate_C4379400_Rotation, _Rotate_C4379400_Out);
				if (Float_3A075C8B == 28) { surface.PreviewOutput = half4(_Rotate_C4379400_Out.x, _Rotate_C4379400_Out.y, 0.0, 1.0); return surface; }
				float4 _SampleTexture2D_1B6152CE_RGBA = UNITY_SAMPLE_TEX2D(Texture_71BAC8EF,_Rotate_C4379400_Out);
				float _SampleTexture2D_1B6152CE_R = _SampleTexture2D_1B6152CE_RGBA.r;
				float _SampleTexture2D_1B6152CE_G = _SampleTexture2D_1B6152CE_RGBA.g;
				float _SampleTexture2D_1B6152CE_B = _SampleTexture2D_1B6152CE_RGBA.b;
				float _SampleTexture2D_1B6152CE_A = _SampleTexture2D_1B6152CE_RGBA.a;
				if (Float_3A075C8B == 29) { surface.PreviewOutput = half4(_SampleTexture2D_1B6152CE_RGBA.x, _SampleTexture2D_1B6152CE_RGBA.y, _SampleTexture2D_1B6152CE_RGBA.z, 1.0); return surface; }
				float4 _Add_F6738658_Out;
				Unity_Add_float(_Add_744F92CF_Out, _SampleTexture2D_1B6152CE_RGBA, _Add_F6738658_Out);
				if (Float_3A075C8B == 30) { surface.PreviewOutput = half4(_Add_F6738658_Out.x, _Add_F6738658_Out.y, _Add_F6738658_Out.z, 1.0); return surface; }
				float4 _Preview_84C2280D_Out;
				Unity_Preview_float(_Add_F6738658_Out, _Preview_84C2280D_Out);
				if (Float_3A075C8B == 31) { surface.PreviewOutput = half4(_Preview_84C2280D_Out.x, _Preview_84C2280D_Out.y, _Preview_84C2280D_Out.z, 1.0); return surface; }
				float4 _OneMinus_F4633EE7_Out;
				Unity_OneMinus_float(_Preview_84C2280D_Out, _OneMinus_F4633EE7_Out);
				if (Float_3A075C8B == 32) { surface.PreviewOutput = half4(_OneMinus_F4633EE7_Out.x, _OneMinus_F4633EE7_Out.y, _OneMinus_F4633EE7_Out.z, 1.0); return surface; }
				float4 _Power_11477883_Out;
				Unity_Power_float(_Preview_84C2280D_Out, _OneMinus_F4633EE7_Out, _Power_11477883_Out);
				if (Float_3A075C8B == 33) { surface.PreviewOutput = half4(_Power_11477883_Out.x, _Power_11477883_Out.y, _Power_11477883_Out.z, 1.0); return surface; }
				float4 _OneMinus_DDC6E182_Out;
				Unity_OneMinus_float(_Power_11477883_Out, _OneMinus_DDC6E182_Out);
				if (Float_3A075C8B == 34) { surface.PreviewOutput = half4(_OneMinus_DDC6E182_Out.x, _OneMinus_DDC6E182_Out.y, _OneMinus_DDC6E182_Out.z, 1.0); return surface; }
				float4 _Clamp_BDAA3814_Out;
				Unity_Clamp_float(_OneMinus_DDC6E182_Out, _Clamp_BDAA3814_Min, _Clamp_BDAA3814_Max, _Clamp_BDAA3814_Out);
				if (Float_3A075C8B == 35) { surface.PreviewOutput = half4(_Clamp_BDAA3814_Out.x, _Clamp_BDAA3814_Out.y, _Clamp_BDAA3814_Out.z, 1.0); return surface; }
				float4 _Property_4713334B_Out = Color_505C057B;
				float4 _Multiply_F4F39E27_Out;
				Unity_Multiply_float(_Clamp_BDAA3814_Out, _Property_4713334B_Out, _Multiply_F4F39E27_Out);
				if (Float_3A075C8B == 36) { surface.PreviewOutput = half4(_Multiply_F4F39E27_Out.x, _Multiply_F4F39E27_Out.y, _Multiply_F4F39E27_Out.z, 1.0); return surface; }
				float4 _Multiply_CEBCAFF4_Out;
				Unity_Multiply_float(_Multiply_F4F39E27_Out, _SampleTexture2D_91CADF20_RGBA, _Multiply_CEBCAFF4_Out);
				if (Float_3A075C8B == 37) { surface.PreviewOutput = half4(_Multiply_CEBCAFF4_Out.x, _Multiply_CEBCAFF4_Out.y, _Multiply_CEBCAFF4_Out.z, 1.0); return surface; }
				float4 _SampleTexture2D_494B731A_RGBA = UNITY_SAMPLE_TEX2D(Texture_2AFFB418,_TilingAndOffset_7EAA610A_Out);
				_SampleTexture2D_494B731A_RGBA.rgb = UnpackNormal(_SampleTexture2D_494B731A_RGBA);
				float _SampleTexture2D_494B731A_R = _SampleTexture2D_494B731A_RGBA.r;
				float _SampleTexture2D_494B731A_G = _SampleTexture2D_494B731A_RGBA.g;
				float _SampleTexture2D_494B731A_B = _SampleTexture2D_494B731A_RGBA.b;
				float _SampleTexture2D_494B731A_A = _SampleTexture2D_494B731A_RGBA.a;
				if (Float_3A075C8B == 38) { surface.PreviewOutput = half4(_SampleTexture2D_494B731A_RGBA.x, _SampleTexture2D_494B731A_RGBA.y, _SampleTexture2D_494B731A_RGBA.z, 1.0); return surface; }
				float _Property_EC4176F_Out = Float_EB2CCD90;
				float3 _NormalStrength_346D7681_Out;
				Unity_NormalStrength_float((_SampleTexture2D_494B731A_RGBA.xyz), _Property_EC4176F_Out, _NormalStrength_346D7681_Out);
				if (Float_3A075C8B == 39) { surface.PreviewOutput = half4(_NormalStrength_346D7681_Out.x, _NormalStrength_346D7681_Out.y, _NormalStrength_346D7681_Out.z, 1.0); return surface; }
				float _Property_FBE1886A_Out = Float_E2DF4406;
				float _Property_987113B4_Out = Float_9736E1F4;
				float _Property_90501703_Out = Float_61B9223D;
				return surface;
			}
	ENDCG
	SubShader
	{
	    Tags { "RenderType"="Opaque" }
	    LOD 100
	    Pass
	    {
	        CGPROGRAM
	        #pragma vertex vert
	        #pragma fragment frag
	        #include "UnityCG.cginc"
	        struct GraphVertexOutput
	        {
	            float4 position : POSITION;
	            half4 uv0 : TEXCOORD;
	        };
	        GraphVertexOutput vert (GraphVertexInput v)
	        {
	            v = PopulateVertexData(v);
	            GraphVertexOutput o;
	            o.position = UnityObjectToClipPos(v.vertex);
	            o.uv0 = v.texcoord0;
	            return o;
	        }
	        fixed4 frag (GraphVertexOutput IN) : SV_Target
	        {
	            float4 uv0  = IN.uv0;
	            SurfaceInputs surfaceInput = (SurfaceInputs)0;;
	            surfaceInput.uv0 = uv0;
	            SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
	            return surf.PreviewOutput;
	        }
	        ENDCG
	    }
	}
}
