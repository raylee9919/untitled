//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN :: 0xffffffff;
DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN :: 0xfffffffe;

DXGI_FORMAT_DEFINED :: 1;

_FACDXGI :: 0x87a;

DXGI_CPU_ACCESS :: enum {
    NONE       :: 0;
    DYNAMIC    :: 1;
    READ_WRITE :: 2;
    SCRATCH    :: 3;
    FIELD      :: 15;

    DXGI_CPU_ACCESS_NONE       :: NONE;
    DXGI_CPU_ACCESS_DYNAMIC    :: DYNAMIC;
    DXGI_CPU_ACCESS_READ_WRITE :: READ_WRITE;
    DXGI_CPU_ACCESS_SCRATCH    :: SCRATCH;
    DXGI_CPU_ACCESS_FIELD      :: FIELD;
}

DXGI_USAGE :: enum_flags u32 {
    SHADER_INPUT         :: 0x00000010;
    RENDER_TARGET_OUTPUT :: 0x00000020;
    BACK_BUFFER          :: 0x00000040;
    SHARED               :: 0x00000080;
    READ_ONLY            :: 0x00000100;
    DISCARD_ON_PRESENT   :: 0x00000200;
    UNORDERED_ACCESS     :: 0x00000400;

    DXGI_USAGE_SHADER_INPUT         :: SHADER_INPUT;
    DXGI_USAGE_RENDER_TARGET_OUTPUT :: RENDER_TARGET_OUTPUT;
    DXGI_USAGE_BACK_BUFFER          :: BACK_BUFFER;
    DXGI_USAGE_SHARED               :: SHARED;
    DXGI_USAGE_READ_ONLY            :: READ_ONLY;
    DXGI_USAGE_DISCARD_ON_PRESENT   :: DISCARD_ON_PRESENT;
    DXGI_USAGE_UNORDERED_ACCESS     :: UNORDERED_ACCESS;
}

DXGI_RESOURCE_PRIORITY :: enum {
    MINIMUM :: 0x28000000;

    LOW     :: 0x50000000;

    NORMAL  :: 0x78000000;

    HIGH    :: 0xa0000000;

    MAXIMUM :: 0xc8000000;

    DXGI_RESOURCE_PRIORITY_MINIMUM :: MINIMUM;

    DXGI_RESOURCE_PRIORITY_LOW     :: LOW;

    DXGI_RESOURCE_PRIORITY_NORMAL  :: NORMAL;

    DXGI_RESOURCE_PRIORITY_HIGH    :: HIGH;

    DXGI_RESOURCE_PRIORITY_MAXIMUM :: MAXIMUM;
}

DXGI_MAP :: enum_flags {
    READ    :: 1;

    WRITE   :: 2;

    DISCARD :: 4;

    DXGI_MAP_READ    :: READ;

    DXGI_MAP_WRITE   :: WRITE;

    DXGI_MAP_DISCARD :: DISCARD;
}

DXGI_ENUM_MODES :: enum_flags {
    INTERLACED      :: 1;

    SCALING         :: 2;

    STEREO          :: 4;

    DISABLED_STEREO :: 8;

    DXGI_ENUM_MODES_INTERLACED      :: INTERLACED;

    DXGI_ENUM_MODES_SCALING         :: SCALING;

    DXGI_ENUM_MODES_STEREO          :: STEREO;

    DXGI_ENUM_MODES_DISABLED_STEREO :: DISABLED_STEREO;
}

DXGI_MAX_SWAP_CHAIN_BUFFERS :: 16;
DXGI_PRESENT :: enum_flags {
    TEST                  :: 0x00000001;
    DO_NOT_SEQUENCE       :: 0x00000002;
    RESTART               :: 0x00000004;
    DO_NOT_WAIT           :: 0x00000008;
    STEREO_PREFER_RIGHT   :: 0x00000010;
    STEREO_TEMPORARY_MONO :: 0x00000020;
    RESTRICT_TO_OUTPUT    :: 0x00000040;
    USE_DURATION          :: 0x00000100;
    ALLOW_TEARING         :: 0x00000200;

    DXGI_PRESENT_TEST                  :: TEST;
    DXGI_PRESENT_DO_NOT_SEQUENCE       :: DO_NOT_SEQUENCE;
    DXGI_PRESENT_RESTART               :: RESTART;
    DXGI_PRESENT_DO_NOT_WAIT           :: DO_NOT_WAIT;
    DXGI_PRESENT_STEREO_PREFER_RIGHT   :: STEREO_PREFER_RIGHT;
    DXGI_PRESENT_STEREO_TEMPORARY_MONO :: STEREO_TEMPORARY_MONO;
    DXGI_PRESENT_RESTRICT_TO_OUTPUT    :: RESTRICT_TO_OUTPUT;
    DXGI_PRESENT_USE_DURATION          :: USE_DURATION;
    DXGI_PRESENT_ALLOW_TEARING         :: ALLOW_TEARING;
}

DXGI_MWA :: enum_flags {
    NO_WINDOW_CHANGES :: 1 << 0;
    NO_ALT_ENTER      :: 1 << 1;
    NO_PRINT_SCREEN   :: 1 << 2;
    VALID             :: 0x7;

    DXGI_MWA_NO_WINDOW_CHANGES :: NO_WINDOW_CHANGES;
    DXGI_MWA_NO_ALT_ENTER      :: NO_ALT_ENTER;
    DXGI_MWA_NO_PRINT_SCREEN   :: NO_PRINT_SCREEN;
    DXGI_MWA_VALID             :: VALID;
}

DXGI_DEBUG_BINARY_VERSION :: 1;

DXGI_INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION :: 0;

DXGI_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT :: 1024;

DXGI_SHARED_RESOURCE_READ :: 0x80000000;

DXGI_SHARED_RESOURCE_WRITE :: 1;

DXGI_CREATE_FACTORY_DEBUG :: 0x1;

DXGI_RATIONAL :: struct {
    Numerator:   u32;
    Denominator: u32;
}

DXGI_SAMPLE_DESC :: struct {
    Count:   u32;
    Quality: u32;
}

DXGI_COLOR_SPACE_TYPE :: enum s32 {
    RGB_FULL_G22_NONE_P709           :: 0;
    RGB_FULL_G10_NONE_P709           :: 1;
    RGB_STUDIO_G22_NONE_P709         :: 2;
    RGB_STUDIO_G22_NONE_P2020        :: 3;
    RESERVED                         :: 4;
    YCBCR_FULL_G22_NONE_P709_X601    :: 5;
    YCBCR_STUDIO_G22_LEFT_P601       :: 6;
    YCBCR_FULL_G22_LEFT_P601         :: 7;
    YCBCR_STUDIO_G22_LEFT_P709       :: 8;
    YCBCR_FULL_G22_LEFT_P709         :: 9;
    YCBCR_STUDIO_G22_LEFT_P2020      :: 10;
    YCBCR_FULL_G22_LEFT_P2020        :: 11;
    RGB_FULL_G2084_NONE_P2020        :: 12;
    YCBCR_STUDIO_G2084_LEFT_P2020    :: 13;
    RGB_STUDIO_G2084_NONE_P2020      :: 14;
    YCBCR_STUDIO_G22_TOPLEFT_P2020   :: 15;
    YCBCR_STUDIO_G2084_TOPLEFT_P2020 :: 16;
    RGB_FULL_G22_NONE_P2020          :: 17;
    YCBCR_STUDIO_GHLG_TOPLEFT_P2020  :: 18;
    YCBCR_FULL_GHLG_TOPLEFT_P2020    :: 19;
    RGB_STUDIO_G24_NONE_P709         :: 20;
    RGB_STUDIO_G24_NONE_P2020        :: 21;
    YCBCR_STUDIO_G24_LEFT_P709       :: 22;
    YCBCR_STUDIO_G24_LEFT_P2020      :: 23;
    YCBCR_STUDIO_G24_TOPLEFT_P2020   :: 24;
    CUSTOM                           :: -1;

    DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709           :: RGB_FULL_G22_NONE_P709;
    DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709           :: RGB_FULL_G10_NONE_P709;
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709         :: RGB_STUDIO_G22_NONE_P709;
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020        :: RGB_STUDIO_G22_NONE_P2020;
    DXGI_COLOR_SPACE_RESERVED                         :: RESERVED;
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601    :: YCBCR_FULL_G22_NONE_P709_X601;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601       :: YCBCR_STUDIO_G22_LEFT_P601;
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601         :: YCBCR_FULL_G22_LEFT_P601;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709       :: YCBCR_STUDIO_G22_LEFT_P709;
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709         :: YCBCR_FULL_G22_LEFT_P709;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020      :: YCBCR_STUDIO_G22_LEFT_P2020;
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020        :: YCBCR_FULL_G22_LEFT_P2020;
    DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020        :: RGB_FULL_G2084_NONE_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020    :: YCBCR_STUDIO_G2084_LEFT_P2020;
    DXGI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020      :: RGB_STUDIO_G2084_NONE_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020   :: YCBCR_STUDIO_G22_TOPLEFT_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020 :: YCBCR_STUDIO_G2084_TOPLEFT_P2020;
    DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020          :: RGB_FULL_G22_NONE_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  :: YCBCR_STUDIO_GHLG_TOPLEFT_P2020;
    DXGI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020    :: YCBCR_FULL_GHLG_TOPLEFT_P2020;
    DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709         :: RGB_STUDIO_G24_NONE_P709;
    DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020        :: RGB_STUDIO_G24_NONE_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709       :: YCBCR_STUDIO_G24_LEFT_P709;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020      :: YCBCR_STUDIO_G24_LEFT_P2020;
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020   :: YCBCR_STUDIO_G24_TOPLEFT_P2020;
    DXGI_COLOR_SPACE_CUSTOM                           :: CUSTOM;
}

DXGI_FORMAT :: enum s32 {
    UNKNOWN                                 :: 0;
    R32G32B32A32_TYPELESS                   :: 1;
    R32G32B32A32_FLOAT                      :: 2;
    R32G32B32A32_UINT                       :: 3;
    R32G32B32A32_SINT                       :: 4;
    R32G32B32_TYPELESS                      :: 5;
    R32G32B32_FLOAT                         :: 6;
    R32G32B32_UINT                          :: 7;
    R32G32B32_SINT                          :: 8;
    R16G16B16A16_TYPELESS                   :: 9;
    R16G16B16A16_FLOAT                      :: 10;
    R16G16B16A16_UNORM                      :: 11;
    R16G16B16A16_UINT                       :: 12;
    R16G16B16A16_SNORM                      :: 13;
    R16G16B16A16_SINT                       :: 14;
    R32G32_TYPELESS                         :: 15;
    R32G32_FLOAT                            :: 16;
    R32G32_UINT                             :: 17;
    R32G32_SINT                             :: 18;
    R32G8X24_TYPELESS                       :: 19;
    D32_FLOAT_S8X24_UINT                    :: 20;
    R32_FLOAT_X8X24_TYPELESS                :: 21;
    X32_TYPELESS_G8X24_UINT                 :: 22;
    R10G10B10A2_TYPELESS                    :: 23;
    R10G10B10A2_UNORM                       :: 24;
    R10G10B10A2_UINT                        :: 25;
    R11G11B10_FLOAT                         :: 26;
    R8G8B8A8_TYPELESS                       :: 27;
    R8G8B8A8_UNORM                          :: 28;
    R8G8B8A8_UNORM_SRGB                     :: 29;
    R8G8B8A8_UINT                           :: 30;
    R8G8B8A8_SNORM                          :: 31;
    R8G8B8A8_SINT                           :: 32;
    R16G16_TYPELESS                         :: 33;
    R16G16_FLOAT                            :: 34;
    R16G16_UNORM                            :: 35;
    R16G16_UINT                             :: 36;
    R16G16_SNORM                            :: 37;
    R16G16_SINT                             :: 38;
    R32_TYPELESS                            :: 39;
    D32_FLOAT                               :: 40;
    R32_FLOAT                               :: 41;
    R32_UINT                                :: 42;
    R32_SINT                                :: 43;
    R24G8_TYPELESS                          :: 44;
    D24_UNORM_S8_UINT                       :: 45;
    R24_UNORM_X8_TYPELESS                   :: 46;
    X24_TYPELESS_G8_UINT                    :: 47;
    R8G8_TYPELESS                           :: 48;
    R8G8_UNORM                              :: 49;
    R8G8_UINT                               :: 50;
    R8G8_SNORM                              :: 51;
    R8G8_SINT                               :: 52;
    R16_TYPELESS                            :: 53;
    R16_FLOAT                               :: 54;
    D16_UNORM                               :: 55;
    R16_UNORM                               :: 56;
    R16_UINT                                :: 57;
    R16_SNORM                               :: 58;
    R16_SINT                                :: 59;
    R8_TYPELESS                             :: 60;
    R8_UNORM                                :: 61;
    R8_UINT                                 :: 62;
    R8_SNORM                                :: 63;
    R8_SINT                                 :: 64;
    A8_UNORM                                :: 65;
    R1_UNORM                                :: 66;
    R9G9B9E5_SHAREDEXP                      :: 67;
    R8G8_B8G8_UNORM                         :: 68;
    G8R8_G8B8_UNORM                         :: 69;
    BC1_TYPELESS                            :: 70;
    BC1_UNORM                               :: 71;
    BC1_UNORM_SRGB                          :: 72;
    BC2_TYPELESS                            :: 73;
    BC2_UNORM                               :: 74;
    BC2_UNORM_SRGB                          :: 75;
    BC3_TYPELESS                            :: 76;
    BC3_UNORM                               :: 77;
    BC3_UNORM_SRGB                          :: 78;
    BC4_TYPELESS                            :: 79;
    BC4_UNORM                               :: 80;
    BC4_SNORM                               :: 81;
    BC5_TYPELESS                            :: 82;
    BC5_UNORM                               :: 83;
    BC5_SNORM                               :: 84;
    B5G6R5_UNORM                            :: 85;
    B5G5R5A1_UNORM                          :: 86;
    B8G8R8A8_UNORM                          :: 87;
    B8G8R8X8_UNORM                          :: 88;
    R10G10B10_XR_BIAS_A2_UNORM              :: 89;
    B8G8R8A8_TYPELESS                       :: 90;
    B8G8R8A8_UNORM_SRGB                     :: 91;
    B8G8R8X8_TYPELESS                       :: 92;
    B8G8R8X8_UNORM_SRGB                     :: 93;
    BC6H_TYPELESS                           :: 94;
    BC6H_UF16                               :: 95;
    BC6H_SF16                               :: 96;
    BC7_TYPELESS                            :: 97;
    BC7_UNORM                               :: 98;
    BC7_UNORM_SRGB                          :: 99;
    AYUV                                    :: 100;
    Y410                                    :: 101;
    Y416                                    :: 102;
    NV12                                    :: 103;
    P010                                    :: 104;
    P016                                    :: 105;
    _420_OPAQUE                             :: 106;
    YUY2                                    :: 107;
    Y210                                    :: 108;
    Y216                                    :: 109;
    NV11                                    :: 110;
    AI44                                    :: 111;
    IA44                                    :: 112;
    P8                                      :: 113;
    A8P8                                    :: 114;
    B4G4R4A4_UNORM                          :: 115;

    P208                                    :: 130;
    V208                                    :: 131;
    V408                                    :: 132;

    SAMPLER_FEEDBACK_MIN_MIP_OPAQUE         :: 189;
    SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE :: 190;

    A4B4G4R4_UNORM                          :: 191;

    FORCE_UINT                              :: -1;

    DXGI_FORMAT_UNKNOWN                                 :: UNKNOWN;
    DXGI_FORMAT_R32G32B32A32_TYPELESS                   :: R32G32B32A32_TYPELESS;
    DXGI_FORMAT_R32G32B32A32_FLOAT                      :: R32G32B32A32_FLOAT;
    DXGI_FORMAT_R32G32B32A32_UINT                       :: R32G32B32A32_UINT;
    DXGI_FORMAT_R32G32B32A32_SINT                       :: R32G32B32A32_SINT;
    DXGI_FORMAT_R32G32B32_TYPELESS                      :: R32G32B32_TYPELESS;
    DXGI_FORMAT_R32G32B32_FLOAT                         :: R32G32B32_FLOAT;
    DXGI_FORMAT_R32G32B32_UINT                          :: R32G32B32_UINT;
    DXGI_FORMAT_R32G32B32_SINT                          :: R32G32B32_SINT;
    DXGI_FORMAT_R16G16B16A16_TYPELESS                   :: R16G16B16A16_TYPELESS;
    DXGI_FORMAT_R16G16B16A16_FLOAT                      :: R16G16B16A16_FLOAT;
    DXGI_FORMAT_R16G16B16A16_UNORM                      :: R16G16B16A16_UNORM;
    DXGI_FORMAT_R16G16B16A16_UINT                       :: R16G16B16A16_UINT;
    DXGI_FORMAT_R16G16B16A16_SNORM                      :: R16G16B16A16_SNORM;
    DXGI_FORMAT_R16G16B16A16_SINT                       :: R16G16B16A16_SINT;
    DXGI_FORMAT_R32G32_TYPELESS                         :: R32G32_TYPELESS;
    DXGI_FORMAT_R32G32_FLOAT                            :: R32G32_FLOAT;
    DXGI_FORMAT_R32G32_UINT                             :: R32G32_UINT;
    DXGI_FORMAT_R32G32_SINT                             :: R32G32_SINT;
    DXGI_FORMAT_R32G8X24_TYPELESS                       :: R32G8X24_TYPELESS;
    DXGI_FORMAT_D32_FLOAT_S8X24_UINT                    :: D32_FLOAT_S8X24_UINT;
    DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS                :: R32_FLOAT_X8X24_TYPELESS;
    DXGI_FORMAT_X32_TYPELESS_G8X24_UINT                 :: X32_TYPELESS_G8X24_UINT;
    DXGI_FORMAT_R10G10B10A2_TYPELESS                    :: R10G10B10A2_TYPELESS;
    DXGI_FORMAT_R10G10B10A2_UNORM                       :: R10G10B10A2_UNORM;
    DXGI_FORMAT_R10G10B10A2_UINT                        :: R10G10B10A2_UINT;
    DXGI_FORMAT_R11G11B10_FLOAT                         :: R11G11B10_FLOAT;
    DXGI_FORMAT_R8G8B8A8_TYPELESS                       :: R8G8B8A8_TYPELESS;
    DXGI_FORMAT_R8G8B8A8_UNORM                          :: R8G8B8A8_UNORM;
    DXGI_FORMAT_R8G8B8A8_UNORM_SRGB                     :: R8G8B8A8_UNORM_SRGB;
    DXGI_FORMAT_R8G8B8A8_UINT                           :: R8G8B8A8_UINT;
    DXGI_FORMAT_R8G8B8A8_SNORM                          :: R8G8B8A8_SNORM;
    DXGI_FORMAT_R8G8B8A8_SINT                           :: R8G8B8A8_SINT;
    DXGI_FORMAT_R16G16_TYPELESS                         :: R16G16_TYPELESS;
    DXGI_FORMAT_R16G16_FLOAT                            :: R16G16_FLOAT;
    DXGI_FORMAT_R16G16_UNORM                            :: R16G16_UNORM;
    DXGI_FORMAT_R16G16_UINT                             :: R16G16_UINT;
    DXGI_FORMAT_R16G16_SNORM                            :: R16G16_SNORM;
    DXGI_FORMAT_R16G16_SINT                             :: R16G16_SINT;
    DXGI_FORMAT_R32_TYPELESS                            :: R32_TYPELESS;
    DXGI_FORMAT_D32_FLOAT                               :: D32_FLOAT;
    DXGI_FORMAT_R32_FLOAT                               :: R32_FLOAT;
    DXGI_FORMAT_R32_UINT                                :: R32_UINT;
    DXGI_FORMAT_R32_SINT                                :: R32_SINT;
    DXGI_FORMAT_R24G8_TYPELESS                          :: R24G8_TYPELESS;
    DXGI_FORMAT_D24_UNORM_S8_UINT                       :: D24_UNORM_S8_UINT;
    DXGI_FORMAT_R24_UNORM_X8_TYPELESS                   :: R24_UNORM_X8_TYPELESS;
    DXGI_FORMAT_X24_TYPELESS_G8_UINT                    :: X24_TYPELESS_G8_UINT;
    DXGI_FORMAT_R8G8_TYPELESS                           :: R8G8_TYPELESS;
    DXGI_FORMAT_R8G8_UNORM                              :: R8G8_UNORM;
    DXGI_FORMAT_R8G8_UINT                               :: R8G8_UINT;
    DXGI_FORMAT_R8G8_SNORM                              :: R8G8_SNORM;
    DXGI_FORMAT_R8G8_SINT                               :: R8G8_SINT;
    DXGI_FORMAT_R16_TYPELESS                            :: R16_TYPELESS;
    DXGI_FORMAT_R16_FLOAT                               :: R16_FLOAT;
    DXGI_FORMAT_D16_UNORM                               :: D16_UNORM;
    DXGI_FORMAT_R16_UNORM                               :: R16_UNORM;
    DXGI_FORMAT_R16_UINT                                :: R16_UINT;
    DXGI_FORMAT_R16_SNORM                               :: R16_SNORM;
    DXGI_FORMAT_R16_SINT                                :: R16_SINT;
    DXGI_FORMAT_R8_TYPELESS                             :: R8_TYPELESS;
    DXGI_FORMAT_R8_UNORM                                :: R8_UNORM;
    DXGI_FORMAT_R8_UINT                                 :: R8_UINT;
    DXGI_FORMAT_R8_SNORM                                :: R8_SNORM;
    DXGI_FORMAT_R8_SINT                                 :: R8_SINT;
    DXGI_FORMAT_A8_UNORM                                :: A8_UNORM;
    DXGI_FORMAT_R1_UNORM                                :: R1_UNORM;
    DXGI_FORMAT_R9G9B9E5_SHAREDEXP                      :: R9G9B9E5_SHAREDEXP;
    DXGI_FORMAT_R8G8_B8G8_UNORM                         :: R8G8_B8G8_UNORM;
    DXGI_FORMAT_G8R8_G8B8_UNORM                         :: G8R8_G8B8_UNORM;
    DXGI_FORMAT_BC1_TYPELESS                            :: BC1_TYPELESS;
    DXGI_FORMAT_BC1_UNORM                               :: BC1_UNORM;
    DXGI_FORMAT_BC1_UNORM_SRGB                          :: BC1_UNORM_SRGB;
    DXGI_FORMAT_BC2_TYPELESS                            :: BC2_TYPELESS;
    DXGI_FORMAT_BC2_UNORM                               :: BC2_UNORM;
    DXGI_FORMAT_BC2_UNORM_SRGB                          :: BC2_UNORM_SRGB;
    DXGI_FORMAT_BC3_TYPELESS                            :: BC3_TYPELESS;
    DXGI_FORMAT_BC3_UNORM                               :: BC3_UNORM;
    DXGI_FORMAT_BC3_UNORM_SRGB                          :: BC3_UNORM_SRGB;
    DXGI_FORMAT_BC4_TYPELESS                            :: BC4_TYPELESS;
    DXGI_FORMAT_BC4_UNORM                               :: BC4_UNORM;
    DXGI_FORMAT_BC4_SNORM                               :: BC4_SNORM;
    DXGI_FORMAT_BC5_TYPELESS                            :: BC5_TYPELESS;
    DXGI_FORMAT_BC5_UNORM                               :: BC5_UNORM;
    DXGI_FORMAT_BC5_SNORM                               :: BC5_SNORM;
    DXGI_FORMAT_B5G6R5_UNORM                            :: B5G6R5_UNORM;
    DXGI_FORMAT_B5G5R5A1_UNORM                          :: B5G5R5A1_UNORM;
    DXGI_FORMAT_B8G8R8A8_UNORM                          :: B8G8R8A8_UNORM;
    DXGI_FORMAT_B8G8R8X8_UNORM                          :: B8G8R8X8_UNORM;
    DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM              :: R10G10B10_XR_BIAS_A2_UNORM;
    DXGI_FORMAT_B8G8R8A8_TYPELESS                       :: B8G8R8A8_TYPELESS;
    DXGI_FORMAT_B8G8R8A8_UNORM_SRGB                     :: B8G8R8A8_UNORM_SRGB;
    DXGI_FORMAT_B8G8R8X8_TYPELESS                       :: B8G8R8X8_TYPELESS;
    DXGI_FORMAT_B8G8R8X8_UNORM_SRGB                     :: B8G8R8X8_UNORM_SRGB;
    DXGI_FORMAT_BC6H_TYPELESS                           :: BC6H_TYPELESS;
    DXGI_FORMAT_BC6H_UF16                               :: BC6H_UF16;
    DXGI_FORMAT_BC6H_SF16                               :: BC6H_SF16;
    DXGI_FORMAT_BC7_TYPELESS                            :: BC7_TYPELESS;
    DXGI_FORMAT_BC7_UNORM                               :: BC7_UNORM;
    DXGI_FORMAT_BC7_UNORM_SRGB                          :: BC7_UNORM_SRGB;
    DXGI_FORMAT_AYUV                                    :: AYUV;
    DXGI_FORMAT_Y410                                    :: Y410;
    DXGI_FORMAT_Y416                                    :: Y416;
    DXGI_FORMAT_NV12                                    :: NV12;
    DXGI_FORMAT_P010                                    :: P010;
    DXGI_FORMAT_P016                                    :: P016;
    DXGI_FORMAT_420_OPAQUE                              :: _420_OPAQUE;
    DXGI_FORMAT_YUY2                                    :: YUY2;
    DXGI_FORMAT_Y210                                    :: Y210;
    DXGI_FORMAT_Y216                                    :: Y216;
    DXGI_FORMAT_NV11                                    :: NV11;
    DXGI_FORMAT_AI44                                    :: AI44;
    DXGI_FORMAT_IA44                                    :: IA44;
    DXGI_FORMAT_P8                                      :: P8;
    DXGI_FORMAT_A8P8                                    :: A8P8;
    DXGI_FORMAT_B4G4R4A4_UNORM                          :: B4G4R4A4_UNORM;

    DXGI_FORMAT_P208                                    :: P208;
    DXGI_FORMAT_V208                                    :: V208;
    DXGI_FORMAT_V408                                    :: V408;

    DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE         :: SAMPLER_FEEDBACK_MIN_MIP_OPAQUE;
    DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE :: SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE;

    DXGI_FORMAT_A4B4G4R4_UNORM                          :: A4B4G4R4_UNORM;

    DXGI_FORMAT_FORCE_UINT                              :: FORCE_UINT;
}

DXGI_RGB :: struct {
    Red:   float;
    Green: float;
    Blue:  float;
}

D3DCOLORVALUE :: struct {
    r: float;
    g: float;
    b: float;
    a: float;
}

DXGI_RGBA :: D3DCOLORVALUE;

DXGI_GAMMA_CONTROL :: struct {
    Scale:      DXGI_RGB;
    Offset:     DXGI_RGB;
    GammaCurve: [1025] DXGI_RGB;
}

DXGI_GAMMA_CONTROL_CAPABILITIES :: struct {
    ScaleAndOffsetSupported: BOOL;
    MaxConvertedValue:       float;
    MinConvertedValue:       float;
    NumGammaControlPoints:   u32;
    ControlPointPositions:   [1025] float;
}

DXGI_MODE_SCANLINE_ORDER :: enum s32 {
    UNSPECIFIED       :: 0;
    PROGRESSIVE       :: 1;
    UPPER_FIELD_FIRST :: 2;
    LOWER_FIELD_FIRST :: 3;

    DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED       :: UNSPECIFIED;
    DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE       :: PROGRESSIVE;
    DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST :: UPPER_FIELD_FIRST;
    DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST :: LOWER_FIELD_FIRST;
}

DXGI_MODE_SCALING :: enum s32 {
    UNSPECIFIED :: 0;
    CENTERED    :: 1;
    STRETCHED   :: 2;

    DXGI_MODE_SCALING_UNSPECIFIED :: UNSPECIFIED;
    DXGI_MODE_SCALING_CENTERED    :: CENTERED;
    DXGI_MODE_SCALING_STRETCHED   :: STRETCHED;
}

DXGI_MODE_ROTATION :: enum s32 {
    UNSPECIFIED :: 0;
    IDENTITY    :: 1;
    ROTATE90    :: 2;
    ROTATE180   :: 3;
    ROTATE270   :: 4;

    DXGI_MODE_ROTATION_UNSPECIFIED :: UNSPECIFIED;
    DXGI_MODE_ROTATION_IDENTITY    :: IDENTITY;
    DXGI_MODE_ROTATION_ROTATE90    :: ROTATE90;
    DXGI_MODE_ROTATION_ROTATE180   :: ROTATE180;
    DXGI_MODE_ROTATION_ROTATE270   :: ROTATE270;
}

DXGI_MODE_DESC :: struct {
    Width:            u32;
    Height:           u32;
    RefreshRate:      DXGI_RATIONAL;
    Format:           DXGI_FORMAT;
    ScanlineOrdering: DXGI_MODE_SCANLINE_ORDER;
    Scaling:          DXGI_MODE_SCALING;
}

DXGI_JPEG_DC_HUFFMAN_TABLE :: struct {
    CodeCounts: [12] u8;
    CodeValues: [12] u8;
}

DXGI_JPEG_AC_HUFFMAN_TABLE :: struct {
    CodeCounts: [16] u8;
    CodeValues: [162] u8;
}

DXGI_JPEG_QUANTIZATION_TABLE :: struct {
    Elements: [64] u8;
}

DXGI_FRAME_STATISTICS :: struct {
    PresentCount:        u32;
    PresentRefreshCount: u32;
    SyncRefreshCount:    u32;
    SyncQPCTime:         LARGE_INTEGER;
    SyncGPUTime:         LARGE_INTEGER;
}

DXGI_MAPPED_RECT :: struct {
    Pitch: s32;
    pBits: *u8;
}

DXGI_ADAPTER_DESC :: struct {
    Description:           [128] s16;
    VendorId:              u32;
    DeviceId:              u32;
    SubSysId:              u32;
    Revision:              u32;
    DedicatedVideoMemory:  SIZE_T;
    DedicatedSystemMemory: SIZE_T;
    SharedSystemMemory:    SIZE_T;
    AdapterLuid:           LUID;
}

DXGI_OUTPUT_DESC :: struct {
    DeviceName:         [32] s16;
    DesktopCoordinates: RECT;
    AttachedToDesktop:  BOOL;
    Rotation:           DXGI_MODE_ROTATION;
    Monitor:            HMONITOR;
}

DXGI_SHARED_RESOURCE :: struct {
    Handle: HANDLE;
}

DXGI_RESIDENCY :: enum s32 {
    FULLY_RESIDENT            :: 1;
    RESIDENT_IN_SHARED_MEMORY :: 2;
    EVICTED_TO_DISK           :: 3;

    DXGI_RESIDENCY_FULLY_RESIDENT            :: FULLY_RESIDENT;
    DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY :: RESIDENT_IN_SHARED_MEMORY;
    DXGI_RESIDENCY_EVICTED_TO_DISK           :: EVICTED_TO_DISK;
}

DXGI_SURFACE_DESC :: struct {
    Width:      u32;
    Height:     u32;
    Format:     DXGI_FORMAT;
    SampleDesc: DXGI_SAMPLE_DESC;
}

DXGI_SWAP_EFFECT :: enum s32 {
    DISCARD         :: 0;
    SEQUENTIAL      :: 1;
    FLIP_SEQUENTIAL :: 3;
    FLIP_DISCARD    :: 4;

    DXGI_SWAP_EFFECT_DISCARD         :: DISCARD;
    DXGI_SWAP_EFFECT_SEQUENTIAL      :: SEQUENTIAL;
    DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL :: FLIP_SEQUENTIAL;
    DXGI_SWAP_EFFECT_FLIP_DISCARD    :: FLIP_DISCARD;
}

DXGI_SWAP_CHAIN_FLAG :: enum_flags u32 {
    NONPREROTATED                          :: 0x1;
    ALLOW_MODE_SWITCH                      :: 0x2;
    GDI_COMPATIBLE                         :: 0x4;
    RESTRICTED_CONTENT                     :: 0x8;
    RESTRICT_SHARED_RESOURCE_DRIVER        :: 0x10;
    DISPLAY_ONLY                           :: 0x20;
    FRAME_LATENCY_WAITABLE_OBJECT          :: 0x40;
    FOREGROUND_LAYER                       :: 0x80;
    FULLSCREEN_VIDEO                       :: 0x100;
    YUV_VIDEO                              :: 0x200;
    HW_PROTECTED                           :: 0x400;
    ALLOW_TEARING                          :: 0x800;
    RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS :: 0x1000;

    DXGI_SWAP_CHAIN_FLAG_NONPREROTATED                          :: NONPREROTATED;
    DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH                      :: ALLOW_MODE_SWITCH;
    DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE                         :: GDI_COMPATIBLE;
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT                     :: RESTRICTED_CONTENT;
    DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER        :: RESTRICT_SHARED_RESOURCE_DRIVER;
    DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY                           :: DISPLAY_ONLY;
    DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT          :: FRAME_LATENCY_WAITABLE_OBJECT;
    DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER                       :: FOREGROUND_LAYER;
    DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO                       :: FULLSCREEN_VIDEO;
    DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO                              :: YUV_VIDEO;
    DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED                           :: HW_PROTECTED;
    DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING                          :: ALLOW_TEARING;
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS :: RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS;
}

DXGI_SWAP_CHAIN_DESC :: struct {
    BufferDesc:   DXGI_MODE_DESC;
    SampleDesc:   DXGI_SAMPLE_DESC;
    BufferUsage:  DXGI_USAGE;
    BufferCount:  u32;
    OutputWindow: HWND;
    Windowed:     BOOL;
    SwapEffect:   DXGI_SWAP_EFFECT;
    Flags:        u32;
}


IDXGIObject_UUID :: "aec22fb8-76f3-4639-9be0-28eb43a67a2e";
IDXGIObject :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIObject_VTable; // Overlay parent's vtable with IDXGIObject’s vtable
}
IDXGIObject_VTable :: struct #type_info_none {
    using vtable:            IUnknown_VTable;
    SetPrivateData:          #type (this: *IDXGIObject, Name: *GUID, DataSize: u32, pData: *void) -> HRESULT #cpp_method;
    SetPrivateDataInterface: #type (this: *IDXGIObject, Name: *GUID, pUnknown: *IUnknown) -> HRESULT #cpp_method;
    GetPrivateData:          #type (this: *IDXGIObject, Name: *GUID, pDataSize: *u32, pData: *void) -> HRESULT #cpp_method;
    GetParent:               #type (this: *IDXGIObject, riid: *IID, ppParent: **void) -> HRESULT #cpp_method;
}
IDXGIObject_SetPrivateData :: inline (this: *IDXGIObject, Name: *GUID, DataSize: u32, pData: *void) -> HRESULT { return this.vtable.SetPrivateData(this, Name, DataSize, pData); }

IDXGIObject_SetPrivateDataInterface :: inline (this: *IDXGIObject, Name: *GUID, pUnknown: *IUnknown) -> HRESULT { return this.vtable.SetPrivateDataInterface(this, Name, pUnknown); }

IDXGIObject_GetPrivateData :: inline (this: *IDXGIObject, Name: *GUID, pDataSize: *u32, pData: *void) -> HRESULT { return this.vtable.GetPrivateData(this, Name, pDataSize, pData); }

IDXGIObject_GetParent :: inline (this: *IDXGIObject, riid: *IID, ppParent: **void) -> HRESULT { return this.vtable.GetParent(this, riid, ppParent); }

vtable :: (obj: *IDXGIObject) -> *IDXGIObject_VTable { return obj.vtable; }



IDXGIDeviceSubObject_UUID :: "3d3e0379-f9de-4d58-bb6c-18d62992f1a6";
IDXGIDeviceSubObject :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIDeviceSubObject_VTable; // Overlay parent's vtable with IDXGIDeviceSubObject’s vtable
}
IDXGIDeviceSubObject_VTable :: struct #type_info_none {
    using,except(vtable) vtable:    IDXGIObject_VTable;
    GetDevice: #type (this: *IDXGIDeviceSubObject, riid: *IID, ppDevice: **void) -> HRESULT #cpp_method;
}
IDXGIDeviceSubObject_GetDevice :: inline (this: *IDXGIDeviceSubObject, riid: *IID, ppDevice: **void) -> HRESULT { return this.vtable.GetDevice(this, riid, ppDevice); }

vtable :: (obj: *IDXGIDeviceSubObject) -> *IDXGIDeviceSubObject_VTable { return obj.vtable; }



IDXGIResource_UUID :: "035f3ab4-482e-4e50-b41f-8a7f8bd8960b";
IDXGIResource :: struct {
    #as using,except(vtable) idxgidevicesubobject: IDXGIDeviceSubObject;

    #overlay (idxgidevicesubobject) vtable: *IDXGIResource_VTable; // Overlay parent's vtable with IDXGIResource’s vtable
}
IDXGIResource_VTable :: struct #type_info_none {
    using,except(vtable) vtable:              IDXGIDeviceSubObject_VTable;
    GetSharedHandle:     #type (this: *IDXGIResource, pSharedHandle: *HANDLE) -> HRESULT #cpp_method;
    GetUsage:            #type (this: *IDXGIResource, pUsage: *DXGI_USAGE) -> HRESULT #cpp_method;
    SetEvictionPriority: #type (this: *IDXGIResource, EvictionPriority: u32) -> HRESULT #cpp_method;
    GetEvictionPriority: #type (this: *IDXGIResource, pEvictionPriority: *u32) -> HRESULT #cpp_method;
}
IDXGIResource_GetSharedHandle :: inline (this: *IDXGIResource, pSharedHandle: *HANDLE) -> HRESULT { return this.vtable.GetSharedHandle(this, pSharedHandle); }

IDXGIResource_GetUsage :: inline (this: *IDXGIResource, pUsage: *DXGI_USAGE) -> HRESULT { return this.vtable.GetUsage(this, pUsage); }

IDXGIResource_SetEvictionPriority :: inline (this: *IDXGIResource, EvictionPriority: u32) -> HRESULT { return this.vtable.SetEvictionPriority(this, EvictionPriority); }

IDXGIResource_GetEvictionPriority :: inline (this: *IDXGIResource, pEvictionPriority: *u32) -> HRESULT { return this.vtable.GetEvictionPriority(this, pEvictionPriority); }

vtable :: (obj: *IDXGIResource) -> *IDXGIResource_VTable { return obj.vtable; }



IDXGIKeyedMutex_UUID :: "9d8e1289-d7b3-465f-8126-250e349af85d";
IDXGIKeyedMutex :: struct {
    #as using,except(vtable) idxgidevicesubobject: IDXGIDeviceSubObject;

    #overlay (idxgidevicesubobject) vtable: *IDXGIKeyedMutex_VTable; // Overlay parent's vtable with IDXGIKeyedMutex’s vtable
}
IDXGIKeyedMutex_VTable :: struct #type_info_none {
    using,except(vtable) vtable:      IDXGIDeviceSubObject_VTable;
    AcquireSync: #type (this: *IDXGIKeyedMutex, Key: u64, dwMilliseconds: u32) -> HRESULT #cpp_method;
    ReleaseSync: #type (this: *IDXGIKeyedMutex, Key: u64) -> HRESULT #cpp_method;
}
IDXGIKeyedMutex_AcquireSync :: inline (this: *IDXGIKeyedMutex, Key: u64, dwMilliseconds: u32) -> HRESULT { return this.vtable.AcquireSync(this, Key, dwMilliseconds); }

IDXGIKeyedMutex_ReleaseSync :: inline (this: *IDXGIKeyedMutex, Key: u64) -> HRESULT { return this.vtable.ReleaseSync(this, Key); }

vtable :: (obj: *IDXGIKeyedMutex) -> *IDXGIKeyedMutex_VTable { return obj.vtable; }



IDXGISurface_UUID :: "cafcb56c-6ac3-4889-bf47-9e23bbd260ec";
IDXGISurface :: struct {
    #as using,except(vtable) idxgidevicesubobject: IDXGIDeviceSubObject;

    #overlay (idxgidevicesubobject) vtable: *IDXGISurface_VTable; // Overlay parent's vtable with IDXGISurface’s vtable
}
IDXGISurface_VTable :: struct #type_info_none {
    using,except(vtable) vtable:  IDXGIDeviceSubObject_VTable;
    GetDesc: #type (this: *IDXGISurface, pDesc: *DXGI_SURFACE_DESC) -> HRESULT #cpp_method;
    Map:     #type (this: *IDXGISurface, pLockedRect: *DXGI_MAPPED_RECT, MapFlags: u32) -> HRESULT #cpp_method;
    Unmap:   #type (this: *IDXGISurface) -> HRESULT #cpp_method;
}
IDXGISurface_GetDesc :: inline (this: *IDXGISurface, pDesc: *DXGI_SURFACE_DESC) -> HRESULT { return this.vtable.GetDesc(this, pDesc); }

IDXGISurface_Map :: inline (this: *IDXGISurface, pLockedRect: *DXGI_MAPPED_RECT, MapFlags: u32) -> HRESULT { return this.vtable.Map(this, pLockedRect, MapFlags); }

IDXGISurface_Unmap :: inline (this: *IDXGISurface) -> HRESULT { return this.vtable.Unmap(this); }

vtable :: (obj: *IDXGISurface) -> *IDXGISurface_VTable { return obj.vtable; }



IDXGISurface1_UUID :: "4AE63092-6327-4c1b-80AE-BFE12EA32B86";
IDXGISurface1 :: struct {
    #as using,except(vtable) idxgisurface: IDXGISurface;

    #overlay (idxgisurface) vtable: *IDXGISurface1_VTable; // Overlay parent's vtable with IDXGISurface1’s vtable
}
IDXGISurface1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:    IDXGISurface_VTable;
    GetDC:     #type (this: *IDXGISurface1, Discard: BOOL, phdc: *HDC) -> HRESULT #cpp_method;
    ReleaseDC: #type (this: *IDXGISurface1, pDirtyRect: *RECT) -> HRESULT #cpp_method;
}
IDXGISurface1_GetDC :: inline (this: *IDXGISurface1, Discard: BOOL, phdc: *HDC) -> HRESULT { return this.vtable.GetDC(this, Discard, phdc); }

IDXGISurface1_ReleaseDC :: inline (this: *IDXGISurface1, pDirtyRect: *RECT) -> HRESULT { return this.vtable.ReleaseDC(this, pDirtyRect); }

vtable :: (obj: *IDXGISurface1) -> *IDXGISurface1_VTable { return obj.vtable; }



IDXGIAdapter_UUID :: "2411e7e1-12ac-4ccf-bd14-9798e8534dc0";
IDXGIAdapter :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIAdapter_VTable; // Overlay parent's vtable with IDXGIAdapter’s vtable
}
IDXGIAdapter_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                IDXGIObject_VTable;
    EnumOutputs:           #type (this: *IDXGIAdapter, Output: u32, ppOutput: **IDXGIOutput) -> HRESULT #cpp_method;
    GetDesc:               #type (this: *IDXGIAdapter, pDesc: *DXGI_ADAPTER_DESC) -> HRESULT #cpp_method;
    CheckInterfaceSupport: #type (this: *IDXGIAdapter, InterfaceName: *GUID, pUMDVersion: *LARGE_INTEGER) -> HRESULT #cpp_method;
}
IDXGIAdapter_EnumOutputs :: inline (this: *IDXGIAdapter, Output: u32, ppOutput: **IDXGIOutput) -> HRESULT { return this.vtable.EnumOutputs(this, Output, ppOutput); }

IDXGIAdapter_GetDesc :: inline (this: *IDXGIAdapter, pDesc: *DXGI_ADAPTER_DESC) -> HRESULT { return this.vtable.GetDesc(this, pDesc); }

IDXGIAdapter_CheckInterfaceSupport :: inline (this: *IDXGIAdapter, InterfaceName: *GUID, pUMDVersion: *LARGE_INTEGER) -> HRESULT { return this.vtable.CheckInterfaceSupport(this, InterfaceName, pUMDVersion); }

vtable :: (obj: *IDXGIAdapter) -> *IDXGIAdapter_VTable { return obj.vtable; }



IDXGIOutput_UUID :: "ae02eedb-c735-4690-8d52-5a8dc20213aa";
IDXGIOutput :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIOutput_VTable; // Overlay parent's vtable with IDXGIOutput’s vtable
}
IDXGIOutput_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                      IDXGIObject_VTable;
    GetDesc:                     #type (this: *IDXGIOutput, pDesc: *DXGI_OUTPUT_DESC) -> HRESULT #cpp_method;
    GetDisplayModeList:          #type (this: *IDXGIOutput, EnumFormat: DXGI_FORMAT, Flags: u32, pNumModes: *u32, pDesc: *DXGI_MODE_DESC) -> HRESULT #cpp_method;
    FindClosestMatchingMode:     #type (this: *IDXGIOutput, pModeToMatch: *DXGI_MODE_DESC, pClosestMatch: *DXGI_MODE_DESC, pConcernedDevice: *IUnknown) -> HRESULT #cpp_method;
    WaitForVBlank:               #type (this: *IDXGIOutput) -> HRESULT #cpp_method;
    TakeOwnership:               #type (this: *IDXGIOutput, pDevice: *IUnknown, Exclusive: BOOL) -> HRESULT #cpp_method;
    ReleaseOwnership:            #type (this: *IDXGIOutput) -> void #cpp_method;
    GetGammaControlCapabilities: #type (this: *IDXGIOutput, pGammaCaps: *DXGI_GAMMA_CONTROL_CAPABILITIES) -> HRESULT #cpp_method;
    SetGammaControl:             #type (this: *IDXGIOutput, pArray: *DXGI_GAMMA_CONTROL) -> HRESULT #cpp_method;
    GetGammaControl:             #type (this: *IDXGIOutput, pArray: *DXGI_GAMMA_CONTROL) -> HRESULT #cpp_method;
    SetDisplaySurface:           #type (this: *IDXGIOutput, pScanoutSurface: *IDXGISurface) -> HRESULT #cpp_method;
    GetDisplaySurfaceData:       #type (this: *IDXGIOutput, pDestination: *IDXGISurface) -> HRESULT #cpp_method;
    GetFrameStatistics:          #type (this: *IDXGIOutput, pStats: *DXGI_FRAME_STATISTICS) -> HRESULT #cpp_method;
}
IDXGIOutput_GetDesc :: inline (this: *IDXGIOutput, pDesc: *DXGI_OUTPUT_DESC) -> HRESULT { return this.vtable.GetDesc(this, pDesc); }

IDXGIOutput_GetDisplayModeList :: inline (this: *IDXGIOutput, EnumFormat: DXGI_FORMAT, Flags: u32, pNumModes: *u32, pDesc: *DXGI_MODE_DESC) -> HRESULT { return this.vtable.GetDisplayModeList(this, EnumFormat, Flags, pNumModes, pDesc); }

IDXGIOutput_FindClosestMatchingMode :: inline (this: *IDXGIOutput, pModeToMatch: *DXGI_MODE_DESC, pClosestMatch: *DXGI_MODE_DESC, pConcernedDevice: *IUnknown) -> HRESULT { return this.vtable.FindClosestMatchingMode(this, pModeToMatch, pClosestMatch, pConcernedDevice); }

IDXGIOutput_WaitForVBlank :: inline (this: *IDXGIOutput) -> HRESULT { return this.vtable.WaitForVBlank(this); }

IDXGIOutput_TakeOwnership :: inline (this: *IDXGIOutput, pDevice: *IUnknown, Exclusive: BOOL) -> HRESULT { return this.vtable.TakeOwnership(this, pDevice, Exclusive); }

IDXGIOutput_ReleaseOwnership :: inline (this: *IDXGIOutput) { this.vtable.ReleaseOwnership(this); }

IDXGIOutput_GetGammaControlCapabilities :: inline (this: *IDXGIOutput, pGammaCaps: *DXGI_GAMMA_CONTROL_CAPABILITIES) -> HRESULT { return this.vtable.GetGammaControlCapabilities(this, pGammaCaps); }

IDXGIOutput_SetGammaControl :: inline (this: *IDXGIOutput, pArray: *DXGI_GAMMA_CONTROL) -> HRESULT { return this.vtable.SetGammaControl(this, pArray); }

IDXGIOutput_GetGammaControl :: inline (this: *IDXGIOutput, pArray: *DXGI_GAMMA_CONTROL) -> HRESULT { return this.vtable.GetGammaControl(this, pArray); }

IDXGIOutput_SetDisplaySurface :: inline (this: *IDXGIOutput, pScanoutSurface: *IDXGISurface) -> HRESULT { return this.vtable.SetDisplaySurface(this, pScanoutSurface); }

IDXGIOutput_GetDisplaySurfaceData :: inline (this: *IDXGIOutput, pDestination: *IDXGISurface) -> HRESULT { return this.vtable.GetDisplaySurfaceData(this, pDestination); }

IDXGIOutput_GetFrameStatistics :: inline (this: *IDXGIOutput, pStats: *DXGI_FRAME_STATISTICS) -> HRESULT { return this.vtable.GetFrameStatistics(this, pStats); }

vtable :: (obj: *IDXGIOutput) -> *IDXGIOutput_VTable { return obj.vtable; }



IDXGISwapChain_UUID :: "310d36a0-d2e7-4c0a-aa04-6a9d23b8886a";
IDXGISwapChain :: struct {
    #as using,except(vtable) idxgidevicesubobject: IDXGIDeviceSubObject;

    #overlay (idxgidevicesubobject) vtable: *IDXGISwapChain_VTable; // Overlay parent's vtable with IDXGISwapChain’s vtable
}
IDXGISwapChain_VTable :: struct #type_info_none {
    using,except(vtable) vtable:              IDXGIDeviceSubObject_VTable;
    Present:             #type (this: *IDXGISwapChain, SyncInterval: u32, Flags: u32) -> HRESULT #cpp_method;
    GetBuffer:           #type (this: *IDXGISwapChain, Buffer: u32, riid: *IID, ppSurface: **void) -> HRESULT #cpp_method;
    SetFullscreenState:  #type (this: *IDXGISwapChain, Fullscreen: BOOL, pTarget: *IDXGIOutput) -> HRESULT #cpp_method;
    GetFullscreenState:  #type (this: *IDXGISwapChain, pFullscreen: *BOOL, ppTarget: **IDXGIOutput) -> HRESULT #cpp_method;
    GetDesc:             #type (this: *IDXGISwapChain, pDesc: *DXGI_SWAP_CHAIN_DESC) -> HRESULT #cpp_method;
    ResizeBuffers:       #type (this: *IDXGISwapChain, BufferCount: u32, Width: u32, Height: u32, NewFormat: DXGI_FORMAT, SwapChainFlags: u32) -> HRESULT #cpp_method;
    ResizeTarget:        #type (this: *IDXGISwapChain, pNewTargetParameters: *DXGI_MODE_DESC) -> HRESULT #cpp_method;
    GetContainingOutput: #type (this: *IDXGISwapChain, ppOutput: **IDXGIOutput) -> HRESULT #cpp_method;
    GetFrameStatistics:  #type (this: *IDXGISwapChain, pStats: *DXGI_FRAME_STATISTICS) -> HRESULT #cpp_method;
    GetLastPresentCount: #type (this: *IDXGISwapChain, pLastPresentCount: *u32) -> HRESULT #cpp_method;
}
IDXGISwapChain_Present :: inline (this: *IDXGISwapChain, SyncInterval: u32, Flags: u32) -> HRESULT { return this.vtable.Present(this, SyncInterval, Flags); }

IDXGISwapChain_GetBuffer :: inline (this: *IDXGISwapChain, Buffer: u32, riid: *IID, ppSurface: **void) -> HRESULT { return this.vtable.GetBuffer(this, Buffer, riid, ppSurface); }

IDXGISwapChain_SetFullscreenState :: inline (this: *IDXGISwapChain, Fullscreen: BOOL, pTarget: *IDXGIOutput) -> HRESULT { return this.vtable.SetFullscreenState(this, Fullscreen, pTarget); }

IDXGISwapChain_GetFullscreenState :: inline (this: *IDXGISwapChain, pFullscreen: *BOOL, ppTarget: **IDXGIOutput) -> HRESULT { return this.vtable.GetFullscreenState(this, pFullscreen, ppTarget); }

IDXGISwapChain_GetDesc :: inline (this: *IDXGISwapChain, pDesc: *DXGI_SWAP_CHAIN_DESC) -> HRESULT { return this.vtable.GetDesc(this, pDesc); }

IDXGISwapChain_ResizeBuffers :: inline (this: *IDXGISwapChain, BufferCount: u32, Width: u32, Height: u32, NewFormat: DXGI_FORMAT, SwapChainFlags: u32) -> HRESULT { return this.vtable.ResizeBuffers(this, BufferCount, Width, Height, NewFormat, SwapChainFlags); }

IDXGISwapChain_ResizeTarget :: inline (this: *IDXGISwapChain, pNewTargetParameters: *DXGI_MODE_DESC) -> HRESULT { return this.vtable.ResizeTarget(this, pNewTargetParameters); }

IDXGISwapChain_GetContainingOutput :: inline (this: *IDXGISwapChain, ppOutput: **IDXGIOutput) -> HRESULT { return this.vtable.GetContainingOutput(this, ppOutput); }

IDXGISwapChain_GetFrameStatistics :: inline (this: *IDXGISwapChain, pStats: *DXGI_FRAME_STATISTICS) -> HRESULT { return this.vtable.GetFrameStatistics(this, pStats); }

IDXGISwapChain_GetLastPresentCount :: inline (this: *IDXGISwapChain, pLastPresentCount: *u32) -> HRESULT { return this.vtable.GetLastPresentCount(this, pLastPresentCount); }

vtable :: (obj: *IDXGISwapChain) -> *IDXGISwapChain_VTable { return obj.vtable; }



IDXGIFactory_UUID :: "7b7166ec-21c7-44ae-b21a-c9ae321ae369";
IDXGIFactory :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIFactory_VTable; // Overlay parent's vtable with IDXGIFactory’s vtable
}
IDXGIFactory_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                IDXGIObject_VTable;
    EnumAdapters:          #type (this: *IDXGIFactory, Adapter: u32, ppAdapter: **IDXGIAdapter) -> HRESULT #cpp_method;
    MakeWindowAssociation: #type (this: *IDXGIFactory, WindowHandle: HWND, Flags: u32) -> HRESULT #cpp_method;
    GetWindowAssociation:  #type (this: *IDXGIFactory, pWindowHandle: *HWND) -> HRESULT #cpp_method;
    CreateSwapChain:       #type (this: *IDXGIFactory, pDevice: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC, ppSwapChain: **IDXGISwapChain) -> HRESULT #cpp_method;
    CreateSoftwareAdapter: #type (this: *IDXGIFactory, Module: HMODULE, ppAdapter: **IDXGIAdapter) -> HRESULT #cpp_method;
}
IDXGIFactory_EnumAdapters :: inline (this: *IDXGIFactory, Adapter: u32, ppAdapter: **IDXGIAdapter) -> HRESULT { return this.vtable.EnumAdapters(this, Adapter, ppAdapter); }

IDXGIFactory_MakeWindowAssociation :: inline (this: *IDXGIFactory, WindowHandle: HWND, Flags: u32) -> HRESULT { return this.vtable.MakeWindowAssociation(this, WindowHandle, Flags); }

IDXGIFactory_GetWindowAssociation :: inline (this: *IDXGIFactory, pWindowHandle: *HWND) -> HRESULT { return this.vtable.GetWindowAssociation(this, pWindowHandle); }

IDXGIFactory_CreateSwapChain :: inline (this: *IDXGIFactory, pDevice: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC, ppSwapChain: **IDXGISwapChain) -> HRESULT { return this.vtable.CreateSwapChain(this, pDevice, pDesc, ppSwapChain); }

IDXGIFactory_CreateSoftwareAdapter :: inline (this: *IDXGIFactory, Module: HMODULE, ppAdapter: **IDXGIAdapter) -> HRESULT { return this.vtable.CreateSoftwareAdapter(this, Module, ppAdapter); }

vtable :: (obj: *IDXGIFactory) -> *IDXGIFactory_VTable { return obj.vtable; }


CreateDXGIFactory :: (riid: *IID, ppFactory: **void) -> HRESULT #foreign dxgi;
CreateDXGIFactory :: (riid: IID, ppFactory: **void) -> HRESULT #no_context {
    return CreateDXGIFactory(*riid, ppFactory);
}

CreateDXGIFactory1 :: (riid: *IID, ppFactory: **void) -> HRESULT #foreign dxgi;
CreateDXGIFactory1 :: (riid: IID, ppFactory: **void) -> HRESULT #no_context {
    return CreateDXGIFactory1(*riid, ppFactory);
}


IDXGIDevice_UUID :: "54ec77fa-1377-44e6-8c32-88fd5f44c84c";
IDXGIDevice :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIDevice_VTable; // Overlay parent's vtable with IDXGIDevice’s vtable
}
IDXGIDevice_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                 IDXGIObject_VTable;
    GetAdapter:             #type (this: *IDXGIDevice, pAdapter: **IDXGIAdapter) -> HRESULT #cpp_method;
    CreateSurface:          #type (this: *IDXGIDevice, pDesc: *DXGI_SURFACE_DESC, NumSurfaces: u32, Usage: DXGI_USAGE, pSharedResource: *DXGI_SHARED_RESOURCE, ppSurface: **IDXGISurface) -> HRESULT #cpp_method;
    QueryResourceResidency: #type (this: *IDXGIDevice, ppResources: **IUnknown, pResidencyStatus: *DXGI_RESIDENCY, NumResources: u32) -> HRESULT #cpp_method;
    SetGPUThreadPriority:   #type (this: *IDXGIDevice, Priority: s32) -> HRESULT #cpp_method;
    GetGPUThreadPriority:   #type (this: *IDXGIDevice, pPriority: *s32) -> HRESULT #cpp_method;
}
IDXGIDevice_GetAdapter :: inline (this: *IDXGIDevice, pAdapter: **IDXGIAdapter) -> HRESULT { return this.vtable.GetAdapter(this, pAdapter); }

IDXGIDevice_CreateSurface :: inline (this: *IDXGIDevice, pDesc: *DXGI_SURFACE_DESC, NumSurfaces: u32, Usage: DXGI_USAGE, pSharedResource: *DXGI_SHARED_RESOURCE, ppSurface: **IDXGISurface) -> HRESULT { return this.vtable.CreateSurface(this, pDesc, NumSurfaces, Usage, pSharedResource, ppSurface); }

IDXGIDevice_QueryResourceResidency :: inline (this: *IDXGIDevice, ppResources: **IUnknown, pResidencyStatus: *DXGI_RESIDENCY, NumResources: u32) -> HRESULT { return this.vtable.QueryResourceResidency(this, ppResources, pResidencyStatus, NumResources); }

IDXGIDevice_SetGPUThreadPriority :: inline (this: *IDXGIDevice, Priority: s32) -> HRESULT { return this.vtable.SetGPUThreadPriority(this, Priority); }

IDXGIDevice_GetGPUThreadPriority :: inline (this: *IDXGIDevice, pPriority: *s32) -> HRESULT { return this.vtable.GetGPUThreadPriority(this, pPriority); }

vtable :: (obj: *IDXGIDevice) -> *IDXGIDevice_VTable { return obj.vtable; }


DXGI_ADAPTER_FLAG :: enum_flags u32 {
    NONE        :: 0x0;
    REMOTE      :: 0x1;
    SOFTWARE    :: 0x2;
    FORCE_DWORD :: 0xffff_ffff;

    DXGI_ADAPTER_FLAG_NONE        :: NONE;
    DXGI_ADAPTER_FLAG_REMOTE      :: REMOTE;
    DXGI_ADAPTER_FLAG_SOFTWARE    :: SOFTWARE;
    DXGI_ADAPTER_FLAG_FORCE_DWORD :: FORCE_DWORD;
}

DXGI_ADAPTER_DESC1 :: struct {
    Description:           [128] s16;
    VendorId:              u32;
    DeviceId:              u32;
    SubSysId:              u32;
    Revision:              u32;
    DedicatedVideoMemory:  SIZE_T;
    DedicatedSystemMemory: SIZE_T;
    SharedSystemMemory:    SIZE_T;
    AdapterLuid:           LUID;
    Flags:                 u32;
}

DXGI_DISPLAY_COLOR_SPACE :: struct {
    PrimaryCoordinates: [8] [2] float;
    WhitePoints:        [16] [2] float;
}


IDXGIFactory1_UUID :: "770aae78-f26f-4dba-a829-253c83d1b387";
IDXGIFactory1 :: struct {
    #as using,except(vtable) idxgifactory: IDXGIFactory;

    #overlay (idxgifactory) vtable: *IDXGIFactory1_VTable; // Overlay parent's vtable with IDXGIFactory1’s vtable
}
IDXGIFactory1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:        IDXGIFactory_VTable;
    EnumAdapters1: #type (this: *IDXGIFactory1, Adapter: u32, ppAdapter: **IDXGIAdapter1) -> HRESULT #cpp_method;
    IsCurrent:     #type (this: *IDXGIFactory1) -> BOOL #cpp_method;
}
IDXGIFactory1_EnumAdapters1 :: inline (this: *IDXGIFactory1, Adapter: u32, ppAdapter: **IDXGIAdapter1) -> HRESULT { return this.vtable.EnumAdapters1(this, Adapter, ppAdapter); }

IDXGIFactory1_IsCurrent :: inline (this: *IDXGIFactory1) -> BOOL { return this.vtable.IsCurrent(this); }

vtable :: (obj: *IDXGIFactory1) -> *IDXGIFactory1_VTable { return obj.vtable; }



IDXGIAdapter1_UUID :: "29038f61-3839-4626-91fd-086879011a05";
IDXGIAdapter1 :: struct {
    #as using,except(vtable) idxgiadapter: IDXGIAdapter;

    #overlay (idxgiadapter) vtable: *IDXGIAdapter1_VTable; // Overlay parent's vtable with IDXGIAdapter1’s vtable
}
IDXGIAdapter1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:   IDXGIAdapter_VTable;
    GetDesc1: #type (this: *IDXGIAdapter1, pDesc: *DXGI_ADAPTER_DESC1) -> HRESULT #cpp_method;
}
IDXGIAdapter1_GetDesc1 :: inline (this: *IDXGIAdapter1, pDesc: *DXGI_ADAPTER_DESC1) -> HRESULT { return this.vtable.GetDesc1(this, pDesc); }

vtable :: (obj: *IDXGIAdapter1) -> *IDXGIAdapter1_VTable { return obj.vtable; }



IDXGIDevice1_UUID :: "77db970f-6276-48ba-ba28-070143b4392c";
IDXGIDevice1 :: struct {
    #as using,except(vtable) idxgidevice: IDXGIDevice;

    #overlay (idxgidevice) vtable: *IDXGIDevice1_VTable; // Overlay parent's vtable with IDXGIDevice1’s vtable
}
IDXGIDevice1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                 IDXGIDevice_VTable;
    SetMaximumFrameLatency: #type (this: *IDXGIDevice1, MaxLatency: u32) -> HRESULT #cpp_method;
    GetMaximumFrameLatency: #type (this: *IDXGIDevice1, pMaxLatency: *u32) -> HRESULT #cpp_method;
}
IDXGIDevice1_SetMaximumFrameLatency :: inline (this: *IDXGIDevice1, MaxLatency: u32) -> HRESULT { return this.vtable.SetMaximumFrameLatency(this, MaxLatency); }

IDXGIDevice1_GetMaximumFrameLatency :: inline (this: *IDXGIDevice1, pMaxLatency: *u32) -> HRESULT { return this.vtable.GetMaximumFrameLatency(this, pMaxLatency); }

vtable :: (obj: *IDXGIDevice1) -> *IDXGIDevice1_VTable { return obj.vtable; }


DXGI_DEBUG_RLO_FLAGS :: enum_flags u32 {
    SUMMARY         :: 0x1;
    DETAIL          :: 0x2;
    IGNORE_INTERNAL :: 0x4;
    ALL             :: 0x7;

    DXGI_DEBUG_RLO_SUMMARY         :: SUMMARY;
    DXGI_DEBUG_RLO_DETAIL          :: DETAIL;
    DXGI_DEBUG_RLO_IGNORE_INTERNAL :: IGNORE_INTERNAL;
    DXGI_DEBUG_RLO_ALL             :: ALL;
}

DXGI_DEBUG_ID :: GUID;

DXGI_INFO_QUEUE_MESSAGE_CATEGORY :: enum s32 {
    UNKNOWN               :: 0;
    MISCELLANEOUS         :: 1;
    INITIALIZATION        :: 2;
    CLEANUP               :: 3;
    COMPILATION           :: 4;
    STATE_CREATION        :: 5;
    STATE_SETTING         :: 6;
    STATE_GETTING         :: 7;
    RESOURCE_MANIPULATION :: 8;
    EXECUTION             :: 9;
    SHADER                :: 10;

    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN               :: UNKNOWN;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS         :: MISCELLANEOUS;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION        :: INITIALIZATION;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP               :: CLEANUP;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION           :: COMPILATION;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION        :: STATE_CREATION;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING         :: STATE_SETTING;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING         :: STATE_GETTING;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION :: RESOURCE_MANIPULATION;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION             :: EXECUTION;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER                :: SHADER;
}

DXGI_INFO_QUEUE_MESSAGE_SEVERITY :: enum s32 {
    CORRUPTION :: 0;
    ERROR      :: 1;
    WARNING    :: 2;
    INFO       :: 3;
    MESSAGE    :: 4;

    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_CORRUPTION :: CORRUPTION;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_ERROR      :: ERROR;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_WARNING    :: WARNING;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_INFO       :: INFO;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_MESSAGE    :: MESSAGE;
}

DXGI_INFO_QUEUE_MESSAGE_ID :: s32;

DXGI_INFO_QUEUE_MESSAGE :: struct {
    Producer:              DXGI_DEBUG_ID;
    Category:              DXGI_INFO_QUEUE_MESSAGE_CATEGORY;
    Severity:              DXGI_INFO_QUEUE_MESSAGE_SEVERITY;
    ID:                    DXGI_INFO_QUEUE_MESSAGE_ID;

    pDescription:          *u8;
    DescriptionByteLength: SIZE_T;
}

DXGI_INFO_QUEUE_FILTER_DESC :: struct {
    NumCategories: u32;

    pCategoryList: *DXGI_INFO_QUEUE_MESSAGE_CATEGORY;
    NumSeverities: u32;

    pSeverityList: *DXGI_INFO_QUEUE_MESSAGE_SEVERITY;
    NumIDs:        u32;

    pIDList:       *DXGI_INFO_QUEUE_MESSAGE_ID;
}

DXGI_INFO_QUEUE_FILTER :: struct {
    AllowList: DXGI_INFO_QUEUE_FILTER_DESC;
    DenyList:  DXGI_INFO_QUEUE_FILTER_DESC;
}

DXGIGetDebugInterface :: (riid: *IID, ppDebug: **void) -> HRESULT #foreign dxgidebug;
DXGIGetDebugInterface :: (riid: IID, ppDebug: **void) -> HRESULT #no_context {
    return DXGIGetDebugInterface(*riid, ppDebug);
}


IDXGIInfoQueue_UUID :: "D67441C7-672A-476f-9E82-CD55B44949CE";
IDXGIInfoQueue :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIInfoQueue_VTable; // Overlay parent's vtable with IDXGIInfoQueue’s vtable
}
IDXGIInfoQueue_VTable :: struct #type_info_none {
    using vtable:                                  IUnknown_VTable;
    SetMessageCountLimit:                          #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, MessageCountLimit: u64) -> HRESULT #cpp_method;
    ClearStoredMessages:                           #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> void #cpp_method;
    GetMessageA:                                   #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, MessageIndex: u64, pMessage: *DXGI_INFO_QUEUE_MESSAGE, pMessageByteLength: *SIZE_T) -> HRESULT #cpp_method;
    GetNumStoredMessagesAllowedByRetrievalFilters: #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    GetNumStoredMessages:                          #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    GetNumMessagesDiscardedByMessageCountLimit:    #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    GetMessageCountLimit:                          #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    GetNumMessagesAllowedByStorageFilter:          #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    GetNumMessagesDeniedByStorageFilter:           #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 #cpp_method;
    AddStorageFilterEntries:                       #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT #cpp_method;
    GetStorageFilter:                              #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER, pFilterByteLength: *SIZE_T) -> HRESULT #cpp_method;
    ClearStorageFilter:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> void #cpp_method;
    PushEmptyStorageFilter:                        #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushDenyAllStorageFilter:                      #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushCopyOfStorageFilter:                       #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushStorageFilter:                             #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT #cpp_method;
    PopStorageFilter:                              #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> void #cpp_method;
    GetStorageFilterStackSize:                     #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u32 #cpp_method;
    AddRetrievalFilterEntries:                     #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT #cpp_method;
    GetRetrievalFilter:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER, pFilterByteLength: *SIZE_T) -> HRESULT #cpp_method;
    ClearRetrievalFilter:                          #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> void #cpp_method;
    PushEmptyRetrievalFilter:                      #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushDenyAllRetrievalFilter:                    #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushCopyOfRetrievalFilter:                     #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT #cpp_method;
    PushRetrievalFilter:                           #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT #cpp_method;
    PopRetrievalFilter:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> void #cpp_method;
    GetRetrievalFilterStackSize:                   #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u32 #cpp_method;
    AddMessage:                                    #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, ID: DXGI_INFO_QUEUE_MESSAGE_ID, pDescription: *u8) -> HRESULT #cpp_method;
    AddApplicationMessage:                         #type (this: *IDXGIInfoQueue, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, pDescription: *u8) -> HRESULT #cpp_method;
    SetBreakOnCategory:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY, bEnable: BOOL) -> HRESULT #cpp_method;
    SetBreakOnSeverity:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, bEnable: BOOL) -> HRESULT #cpp_method;
    SetBreakOnID:                                  #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, ID: DXGI_INFO_QUEUE_MESSAGE_ID, bEnable: BOOL) -> HRESULT #cpp_method;
    GetBreakOnCategory:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY) -> BOOL #cpp_method;
    GetBreakOnSeverity:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY) -> BOOL #cpp_method;
    GetBreakOnID:                                  #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, ID: DXGI_INFO_QUEUE_MESSAGE_ID) -> BOOL #cpp_method;
    SetMuteDebugOutput:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, bMute: BOOL) -> void #cpp_method;
    GetMuteDebugOutput:                            #type (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> BOOL #cpp_method;
}
IDXGIInfoQueue_SetMessageCountLimit :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, MessageCountLimit: u64) -> HRESULT { return this.vtable.SetMessageCountLimit(this, Producer, MessageCountLimit); }

IDXGIInfoQueue_ClearStoredMessages :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) { this.vtable.ClearStoredMessages(this, Producer); }

IDXGIInfoQueue_GetMessageA :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, MessageIndex: u64, pMessage: *DXGI_INFO_QUEUE_MESSAGE, pMessageByteLength: *SIZE_T) -> HRESULT { return this.vtable.GetMessageA(this, Producer, MessageIndex, pMessage, pMessageByteLength); }

IDXGIInfoQueue_GetNumStoredMessagesAllowedByRetrievalFilters :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetNumStoredMessagesAllowedByRetrievalFilters(this, Producer); }

IDXGIInfoQueue_GetNumStoredMessages :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetNumStoredMessages(this, Producer); }

IDXGIInfoQueue_GetNumMessagesDiscardedByMessageCountLimit :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetNumMessagesDiscardedByMessageCountLimit(this, Producer); }

IDXGIInfoQueue_GetMessageCountLimit :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetMessageCountLimit(this, Producer); }

IDXGIInfoQueue_GetNumMessagesAllowedByStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetNumMessagesAllowedByStorageFilter(this, Producer); }

IDXGIInfoQueue_GetNumMessagesDeniedByStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u64 { return this.vtable.GetNumMessagesDeniedByStorageFilter(this, Producer); }

IDXGIInfoQueue_AddStorageFilterEntries :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT { return this.vtable.AddStorageFilterEntries(this, Producer, pFilter); }

IDXGIInfoQueue_GetStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER, pFilterByteLength: *SIZE_T) -> HRESULT { return this.vtable.GetStorageFilter(this, Producer, pFilter, pFilterByteLength); }

IDXGIInfoQueue_ClearStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) { this.vtable.ClearStorageFilter(this, Producer); }

IDXGIInfoQueue_PushEmptyStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushEmptyStorageFilter(this, Producer); }

IDXGIInfoQueue_PushDenyAllStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushDenyAllStorageFilter(this, Producer); }

IDXGIInfoQueue_PushCopyOfStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushCopyOfStorageFilter(this, Producer); }

IDXGIInfoQueue_PushStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT { return this.vtable.PushStorageFilter(this, Producer, pFilter); }

IDXGIInfoQueue_PopStorageFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) { this.vtable.PopStorageFilter(this, Producer); }

IDXGIInfoQueue_GetStorageFilterStackSize :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u32 { return this.vtable.GetStorageFilterStackSize(this, Producer); }

IDXGIInfoQueue_AddRetrievalFilterEntries :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT { return this.vtable.AddRetrievalFilterEntries(this, Producer, pFilter); }

IDXGIInfoQueue_GetRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER, pFilterByteLength: *SIZE_T) -> HRESULT { return this.vtable.GetRetrievalFilter(this, Producer, pFilter, pFilterByteLength); }

IDXGIInfoQueue_ClearRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) { this.vtable.ClearRetrievalFilter(this, Producer); }

IDXGIInfoQueue_PushEmptyRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushEmptyRetrievalFilter(this, Producer); }

IDXGIInfoQueue_PushDenyAllRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushDenyAllRetrievalFilter(this, Producer); }

IDXGIInfoQueue_PushCopyOfRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> HRESULT { return this.vtable.PushCopyOfRetrievalFilter(this, Producer); }

IDXGIInfoQueue_PushRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, pFilter: *DXGI_INFO_QUEUE_FILTER) -> HRESULT { return this.vtable.PushRetrievalFilter(this, Producer, pFilter); }

IDXGIInfoQueue_PopRetrievalFilter :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) { this.vtable.PopRetrievalFilter(this, Producer); }

IDXGIInfoQueue_GetRetrievalFilterStackSize :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> u32 { return this.vtable.GetRetrievalFilterStackSize(this, Producer); }

IDXGIInfoQueue_AddMessage :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, ID: DXGI_INFO_QUEUE_MESSAGE_ID, pDescription: *u8) -> HRESULT { return this.vtable.AddMessage(this, Producer, Category, Severity, ID, pDescription); }

IDXGIInfoQueue_AddApplicationMessage :: inline (this: *IDXGIInfoQueue, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, pDescription: *u8) -> HRESULT { return this.vtable.AddApplicationMessage(this, Severity, pDescription); }

IDXGIInfoQueue_SetBreakOnCategory :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY, bEnable: BOOL) -> HRESULT { return this.vtable.SetBreakOnCategory(this, Producer, Category, bEnable); }

IDXGIInfoQueue_SetBreakOnSeverity :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY, bEnable: BOOL) -> HRESULT { return this.vtable.SetBreakOnSeverity(this, Producer, Severity, bEnable); }

IDXGIInfoQueue_SetBreakOnID :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, ID: DXGI_INFO_QUEUE_MESSAGE_ID, bEnable: BOOL) -> HRESULT { return this.vtable.SetBreakOnID(this, Producer, ID, bEnable); }

IDXGIInfoQueue_GetBreakOnCategory :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Category: DXGI_INFO_QUEUE_MESSAGE_CATEGORY) -> BOOL { return this.vtable.GetBreakOnCategory(this, Producer, Category); }

IDXGIInfoQueue_GetBreakOnSeverity :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, Severity: DXGI_INFO_QUEUE_MESSAGE_SEVERITY) -> BOOL { return this.vtable.GetBreakOnSeverity(this, Producer, Severity); }

IDXGIInfoQueue_GetBreakOnID :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, ID: DXGI_INFO_QUEUE_MESSAGE_ID) -> BOOL { return this.vtable.GetBreakOnID(this, Producer, ID); }

IDXGIInfoQueue_SetMuteDebugOutput :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID, bMute: BOOL) { this.vtable.SetMuteDebugOutput(this, Producer, bMute); }

IDXGIInfoQueue_GetMuteDebugOutput :: inline (this: *IDXGIInfoQueue, Producer: DXGI_DEBUG_ID) -> BOOL { return this.vtable.GetMuteDebugOutput(this, Producer); }

vtable :: (obj: *IDXGIInfoQueue) -> *IDXGIInfoQueue_VTable { return obj.vtable; }



IDXGIDebug_UUID :: "119E7452-DE9E-40fe-8806-88F90C12B441";
IDXGIDebug :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIDebug_VTable; // Overlay parent's vtable with IDXGIDebug’s vtable
}
IDXGIDebug_VTable :: struct #type_info_none {
    using vtable:      IUnknown_VTable;
    ReportLiveObjects: #type (this: *IDXGIDebug, apiid: GUID, flags: DXGI_DEBUG_RLO_FLAGS) -> HRESULT #cpp_method;
}
IDXGIDebug_ReportLiveObjects :: inline (this: *IDXGIDebug, apiid: GUID, flags: DXGI_DEBUG_RLO_FLAGS) -> HRESULT { return this.vtable.ReportLiveObjects(this, apiid, flags); }

vtable :: (obj: *IDXGIDebug) -> *IDXGIDebug_VTable { return obj.vtable; }



IDXGIDebug1_UUID :: "c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550";
IDXGIDebug1 :: struct {
    #as using,except(vtable) idxgidebug: IDXGIDebug;

    #overlay (idxgidebug) vtable: *IDXGIDebug1_VTable; // Overlay parent's vtable with IDXGIDebug1’s vtable
}
IDXGIDebug1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                         IDXGIDebug_VTable;
    EnableLeakTrackingForThread:    #type (this: *IDXGIDebug1) -> void #cpp_method;
    DisableLeakTrackingForThread:   #type (this: *IDXGIDebug1) -> void #cpp_method;
    IsLeakTrackingEnabledForThread: #type (this: *IDXGIDebug1) -> BOOL #cpp_method;
}
IDXGIDebug1_EnableLeakTrackingForThread :: inline (this: *IDXGIDebug1) { this.vtable.EnableLeakTrackingForThread(this); }

IDXGIDebug1_DisableLeakTrackingForThread :: inline (this: *IDXGIDebug1) { this.vtable.DisableLeakTrackingForThread(this); }

IDXGIDebug1_IsLeakTrackingEnabledForThread :: inline (this: *IDXGIDebug1) -> BOOL { return this.vtable.IsLeakTrackingEnabledForThread(this); }

vtable :: (obj: *IDXGIDebug1) -> *IDXGIDebug1_VTable { return obj.vtable; }



IDXGIDisplayControl_UUID :: "ea9dbf1a-c88e-4486-854a-98aa0138f30c";
IDXGIDisplayControl :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIDisplayControl_VTable; // Overlay parent's vtable with IDXGIDisplayControl’s vtable
}
IDXGIDisplayControl_VTable :: struct #type_info_none {
    using vtable:     IUnknown_VTable;
    IsStereoEnabled:  #type (this: *IDXGIDisplayControl) -> BOOL #cpp_method;
    SetStereoEnabled: #type (this: *IDXGIDisplayControl, enabled: BOOL) -> void #cpp_method;
}
IDXGIDisplayControl_IsStereoEnabled :: inline (this: *IDXGIDisplayControl) -> BOOL { return this.vtable.IsStereoEnabled(this); }

IDXGIDisplayControl_SetStereoEnabled :: inline (this: *IDXGIDisplayControl, enabled: BOOL) { this.vtable.SetStereoEnabled(this, enabled); }

vtable :: (obj: *IDXGIDisplayControl) -> *IDXGIDisplayControl_VTable { return obj.vtable; }


DXGI_OUTDUPL_MOVE_RECT :: struct {
    SourcePoint:     POINT;
    DestinationRect: RECT;
}

DXGI_OUTDUPL_DESC :: struct {
    ModeDesc:                   DXGI_MODE_DESC;
    Rotation:                   DXGI_MODE_ROTATION;
    DesktopImageInSystemMemory: BOOL;
}

DXGI_OUTDUPL_POINTER_POSITION :: struct {
    Position: POINT;
    Visible:  BOOL;
}

DXGI_OUTDUPL_POINTER_SHAPE_TYPE :: enum s32 {
    MONOCHROME   :: 1;
    COLOR        :: 2;
    MASKED_COLOR :: 4;

    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME   :: MONOCHROME;
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR        :: COLOR;
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR :: MASKED_COLOR;
}

DXGI_OUTDUPL_POINTER_SHAPE_INFO :: struct {
    Type:    u32;
    Width:   u32;
    Height:  u32;
    Pitch:   u32;
    HotSpot: POINT;
}

DXGI_OUTDUPL_FRAME_INFO :: struct {
    LastPresentTime:           LARGE_INTEGER;
    LastMouseUpdateTime:       LARGE_INTEGER;
    AccumulatedFrames:         u32;
    RectsCoalesced:            BOOL;
    ProtectedContentMaskedOut: BOOL;
    PointerPosition:           DXGI_OUTDUPL_POINTER_POSITION;
    TotalMetadataBufferSize:   u32;
    PointerShapeBufferSize:    u32;
}


IDXGIOutputDuplication_UUID :: "191cfac3-a341-470d-b26e-a864f428319c";
IDXGIOutputDuplication :: struct {
    #as using,except(vtable) idxgiobject: IDXGIObject;

    #overlay (idxgiobject) vtable: *IDXGIOutputDuplication_VTable; // Overlay parent's vtable with IDXGIOutputDuplication’s vtable
}
IDXGIOutputDuplication_VTable :: struct #type_info_none {
    using,except(vtable) vtable:               IDXGIObject_VTable;
    GetDesc:              #type (this: *IDXGIOutputDuplication, pDesc: *DXGI_OUTDUPL_DESC) -> void #cpp_method;
    AcquireNextFrame:     #type (this: *IDXGIOutputDuplication, TimeoutInMilliseconds: u32, pFrameInfo: *DXGI_OUTDUPL_FRAME_INFO, ppDesktopResource: **IDXGIResource) -> HRESULT #cpp_method;
    GetFrameDirtyRects:   #type (this: *IDXGIOutputDuplication, DirtyRectsBufferSize: u32, pDirtyRectsBuffer: *RECT, pDirtyRectsBufferSizeRequired: *u32) -> HRESULT #cpp_method;
    GetFrameMoveRects:    #type (this: *IDXGIOutputDuplication, MoveRectsBufferSize: u32, pMoveRectBuffer: *DXGI_OUTDUPL_MOVE_RECT, pMoveRectsBufferSizeRequired: *u32) -> HRESULT #cpp_method;
    GetFramePointerShape: #type (this: *IDXGIOutputDuplication, PointerShapeBufferSize: u32, pPointerShapeBuffer: *void, pPointerShapeBufferSizeRequired: *u32, pPointerShapeInfo: *DXGI_OUTDUPL_POINTER_SHAPE_INFO) -> HRESULT #cpp_method;
    MapDesktopSurface:    #type (this: *IDXGIOutputDuplication, pLockedRect: *DXGI_MAPPED_RECT) -> HRESULT #cpp_method;
    UnMapDesktopSurface:  #type (this: *IDXGIOutputDuplication) -> HRESULT #cpp_method;
    ReleaseFrame:         #type (this: *IDXGIOutputDuplication) -> HRESULT #cpp_method;
}
IDXGIOutputDuplication_GetDesc :: inline (this: *IDXGIOutputDuplication, pDesc: *DXGI_OUTDUPL_DESC) { this.vtable.GetDesc(this, pDesc); }

IDXGIOutputDuplication_AcquireNextFrame :: inline (this: *IDXGIOutputDuplication, TimeoutInMilliseconds: u32, pFrameInfo: *DXGI_OUTDUPL_FRAME_INFO, ppDesktopResource: **IDXGIResource) -> HRESULT { return this.vtable.AcquireNextFrame(this, TimeoutInMilliseconds, pFrameInfo, ppDesktopResource); }

IDXGIOutputDuplication_GetFrameDirtyRects :: inline (this: *IDXGIOutputDuplication, DirtyRectsBufferSize: u32, pDirtyRectsBuffer: *RECT, pDirtyRectsBufferSizeRequired: *u32) -> HRESULT { return this.vtable.GetFrameDirtyRects(this, DirtyRectsBufferSize, pDirtyRectsBuffer, pDirtyRectsBufferSizeRequired); }

IDXGIOutputDuplication_GetFrameMoveRects :: inline (this: *IDXGIOutputDuplication, MoveRectsBufferSize: u32, pMoveRectBuffer: *DXGI_OUTDUPL_MOVE_RECT, pMoveRectsBufferSizeRequired: *u32) -> HRESULT { return this.vtable.GetFrameMoveRects(this, MoveRectsBufferSize, pMoveRectBuffer, pMoveRectsBufferSizeRequired); }

IDXGIOutputDuplication_GetFramePointerShape :: inline (this: *IDXGIOutputDuplication, PointerShapeBufferSize: u32, pPointerShapeBuffer: *void, pPointerShapeBufferSizeRequired: *u32, pPointerShapeInfo: *DXGI_OUTDUPL_POINTER_SHAPE_INFO) -> HRESULT { return this.vtable.GetFramePointerShape(this, PointerShapeBufferSize, pPointerShapeBuffer, pPointerShapeBufferSizeRequired, pPointerShapeInfo); }

IDXGIOutputDuplication_MapDesktopSurface :: inline (this: *IDXGIOutputDuplication, pLockedRect: *DXGI_MAPPED_RECT) -> HRESULT { return this.vtable.MapDesktopSurface(this, pLockedRect); }

IDXGIOutputDuplication_UnMapDesktopSurface :: inline (this: *IDXGIOutputDuplication) -> HRESULT { return this.vtable.UnMapDesktopSurface(this); }

IDXGIOutputDuplication_ReleaseFrame :: inline (this: *IDXGIOutputDuplication) -> HRESULT { return this.vtable.ReleaseFrame(this); }

vtable :: (obj: *IDXGIOutputDuplication) -> *IDXGIOutputDuplication_VTable { return obj.vtable; }


DXGI_ALPHA_MODE :: enum s32 {
    UNSPECIFIED   :: 0;
    PREMULTIPLIED :: 1;
    STRAIGHT      :: 2;
    IGNORE        :: 3;
    FORCE_DWORD   :: -1;

    DXGI_ALPHA_MODE_UNSPECIFIED   :: UNSPECIFIED;
    DXGI_ALPHA_MODE_PREMULTIPLIED :: PREMULTIPLIED;
    DXGI_ALPHA_MODE_STRAIGHT      :: STRAIGHT;
    DXGI_ALPHA_MODE_IGNORE        :: IGNORE;
    DXGI_ALPHA_MODE_FORCE_DWORD   :: FORCE_DWORD;
}


IDXGISurface2_UUID :: "aba496dd-b617-4cb8-a866-bc44d7eb1fa2";
IDXGISurface2 :: struct {
    #as using,except(vtable) idxgisurface1: IDXGISurface1;

    #overlay (idxgisurface1) vtable: *IDXGISurface2_VTable; // Overlay parent's vtable with IDXGISurface2’s vtable
}
IDXGISurface2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:      IDXGISurface1_VTable;
    GetResource: #type (this: *IDXGISurface2, riid: *IID, ppParentResource: **void, pSubresourceIndex: *u32) -> HRESULT #cpp_method;
}
IDXGISurface2_GetResource :: inline (this: *IDXGISurface2, riid: *IID, ppParentResource: **void, pSubresourceIndex: *u32) -> HRESULT { return this.vtable.GetResource(this, riid, ppParentResource, pSubresourceIndex); }

vtable :: (obj: *IDXGISurface2) -> *IDXGISurface2_VTable { return obj.vtable; }



IDXGIResource1_UUID :: "30961379-4609-4a41-998e-54fe567ee0c1";
IDXGIResource1 :: struct {
    #as using,except(vtable) idxgiresource: IDXGIResource;

    #overlay (idxgiresource) vtable: *IDXGIResource1_VTable; // Overlay parent's vtable with IDXGIResource1’s vtable
}
IDXGIResource1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                   IDXGIResource_VTable;
    CreateSubresourceSurface: #type (this: *IDXGIResource1, index: u32, ppSurface: **IDXGISurface2) -> HRESULT #cpp_method;
    CreateSharedHandle:       #type (this: *IDXGIResource1, pAttributes: *SECURITY_ATTRIBUTES, dwAccess: u32, lpName: *s16, pHandle: *HANDLE) -> HRESULT #cpp_method;
}
IDXGIResource1_CreateSubresourceSurface :: inline (this: *IDXGIResource1, index: u32, ppSurface: **IDXGISurface2) -> HRESULT { return this.vtable.CreateSubresourceSurface(this, index, ppSurface); }

IDXGIResource1_CreateSharedHandle :: inline (this: *IDXGIResource1, pAttributes: *SECURITY_ATTRIBUTES, dwAccess: u32, lpName: *s16, pHandle: *HANDLE) -> HRESULT { return this.vtable.CreateSharedHandle(this, pAttributes, dwAccess, lpName, pHandle); }

vtable :: (obj: *IDXGIResource1) -> *IDXGIResource1_VTable { return obj.vtable; }


DXGI_OFFER_RESOURCE_PRIORITY :: enum s32 {
    LOW    :: 1;
    NORMAL :: 2;
    HIGH   :: 3;

    DXGI_OFFER_RESOURCE_PRIORITY_LOW    :: LOW;
    DXGI_OFFER_RESOURCE_PRIORITY_NORMAL :: NORMAL;
    DXGI_OFFER_RESOURCE_PRIORITY_HIGH   :: HIGH;
}


IDXGIDevice2_UUID :: "05008617-fbfd-4051-a790-144884b4f6a9";
IDXGIDevice2 :: struct {
    #as using,except(vtable) idxgidevice1: IDXGIDevice1;

    #overlay (idxgidevice1) vtable: *IDXGIDevice2_VTable; // Overlay parent's vtable with IDXGIDevice2’s vtable
}
IDXGIDevice2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:           IDXGIDevice1_VTable;
    OfferResources:   #type (this: *IDXGIDevice2, NumResources: u32, ppResources: **IDXGIResource, Priority: DXGI_OFFER_RESOURCE_PRIORITY) -> HRESULT #cpp_method;
    ReclaimResources: #type (this: *IDXGIDevice2, NumResources: u32, ppResources: **IDXGIResource, pDiscarded: *BOOL) -> HRESULT #cpp_method;
    EnqueueSetEvent:  #type (this: *IDXGIDevice2, hEvent: HANDLE) -> HRESULT #cpp_method;
}
IDXGIDevice2_OfferResources :: inline (this: *IDXGIDevice2, NumResources: u32, ppResources: **IDXGIResource, Priority: DXGI_OFFER_RESOURCE_PRIORITY) -> HRESULT { return this.vtable.OfferResources(this, NumResources, ppResources, Priority); }

IDXGIDevice2_ReclaimResources :: inline (this: *IDXGIDevice2, NumResources: u32, ppResources: **IDXGIResource, pDiscarded: *BOOL) -> HRESULT { return this.vtable.ReclaimResources(this, NumResources, ppResources, pDiscarded); }

IDXGIDevice2_EnqueueSetEvent :: inline (this: *IDXGIDevice2, hEvent: HANDLE) -> HRESULT { return this.vtable.EnqueueSetEvent(this, hEvent); }

vtable :: (obj: *IDXGIDevice2) -> *IDXGIDevice2_VTable { return obj.vtable; }


DXGI_MODE_DESC1 :: struct {
    Width:            u32;
    Height:           u32;
    RefreshRate:      DXGI_RATIONAL;
    Format:           DXGI_FORMAT;
    ScanlineOrdering: DXGI_MODE_SCANLINE_ORDER;
    Scaling:          DXGI_MODE_SCALING;
    Stereo:           BOOL;
}

DXGI_SCALING :: enum s32 {
    STRETCH              :: 0;
    NONE                 :: 1;
    ASPECT_RATIO_STRETCH :: 2;

    DXGI_SCALING_STRETCH              :: STRETCH;
    DXGI_SCALING_NONE                 :: NONE;
    DXGI_SCALING_ASPECT_RATIO_STRETCH :: ASPECT_RATIO_STRETCH;
}

DXGI_SWAP_CHAIN_DESC1 :: struct {
    Width:       u32;
    Height:      u32;
    Format:      DXGI_FORMAT;
    Stereo:      BOOL;
    SampleDesc:  DXGI_SAMPLE_DESC;
    BufferUsage: DXGI_USAGE;
    BufferCount: u32;
    Scaling:     DXGI_SCALING;
    SwapEffect:  DXGI_SWAP_EFFECT;
    AlphaMode:   DXGI_ALPHA_MODE;
    Flags:       u32;
}

DXGI_SWAP_CHAIN_FULLSCREEN_DESC :: struct {
    RefreshRate:      DXGI_RATIONAL;
    ScanlineOrdering: DXGI_MODE_SCANLINE_ORDER;
    Scaling:          DXGI_MODE_SCALING;
    Windowed:         BOOL;
}

DXGI_PRESENT_PARAMETERS :: struct {
    DirtyRectsCount: u32;

    pDirtyRects:     *RECT;
    pScrollRect:     *RECT;
    pScrollOffset:   *POINT;
}


IDXGISwapChain1_UUID :: "790a45f7-0d42-4876-983a-0a55cfe6f4aa";
IDXGISwapChain1 :: struct {
    #as using,except(vtable) idxgiswapchain: IDXGISwapChain;

    #overlay (idxgiswapchain) vtable: *IDXGISwapChain1_VTable; // Overlay parent's vtable with IDXGISwapChain1’s vtable
}
IDXGISwapChain1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                   IDXGISwapChain_VTable;
    GetDesc1:                 #type (this: *IDXGISwapChain1, pDesc: *DXGI_SWAP_CHAIN_DESC1) -> HRESULT #cpp_method;
    GetFullscreenDesc:        #type (this: *IDXGISwapChain1, pDesc: *DXGI_SWAP_CHAIN_FULLSCREEN_DESC) -> HRESULT #cpp_method;
    GetHwnd:                  #type (this: *IDXGISwapChain1, pHwnd: *HWND) -> HRESULT #cpp_method;
    GetCoreWindow:            #type (this: *IDXGISwapChain1, refiid: *IID, ppUnk: **void) -> HRESULT #cpp_method;
    Present1:                 #type (this: *IDXGISwapChain1, SyncInterval: u32, PresentFlags: u32, pPresentParameters: *DXGI_PRESENT_PARAMETERS) -> HRESULT #cpp_method;
    IsTemporaryMonoSupported: #type (this: *IDXGISwapChain1) -> BOOL #cpp_method;
    GetRestrictToOutput:      #type (this: *IDXGISwapChain1, ppRestrictToOutput: **IDXGIOutput) -> HRESULT #cpp_method;
    SetBackgroundColor:       #type (this: *IDXGISwapChain1, pColor: *DXGI_RGBA) -> HRESULT #cpp_method;
    GetBackgroundColor:       #type (this: *IDXGISwapChain1, pColor: *DXGI_RGBA) -> HRESULT #cpp_method;
    SetRotation:              #type (this: *IDXGISwapChain1, Rotation: DXGI_MODE_ROTATION) -> HRESULT #cpp_method;
    GetRotation:              #type (this: *IDXGISwapChain1, pRotation: *DXGI_MODE_ROTATION) -> HRESULT #cpp_method;
}
IDXGISwapChain1_GetDesc1 :: inline (this: *IDXGISwapChain1, pDesc: *DXGI_SWAP_CHAIN_DESC1) -> HRESULT { return this.vtable.GetDesc1(this, pDesc); }

IDXGISwapChain1_GetFullscreenDesc :: inline (this: *IDXGISwapChain1, pDesc: *DXGI_SWAP_CHAIN_FULLSCREEN_DESC) -> HRESULT { return this.vtable.GetFullscreenDesc(this, pDesc); }

IDXGISwapChain1_GetHwnd :: inline (this: *IDXGISwapChain1, pHwnd: *HWND) -> HRESULT { return this.vtable.GetHwnd(this, pHwnd); }

IDXGISwapChain1_GetCoreWindow :: inline (this: *IDXGISwapChain1, refiid: *IID, ppUnk: **void) -> HRESULT { return this.vtable.GetCoreWindow(this, refiid, ppUnk); }

IDXGISwapChain1_Present1 :: inline (this: *IDXGISwapChain1, SyncInterval: u32, PresentFlags: u32, pPresentParameters: *DXGI_PRESENT_PARAMETERS) -> HRESULT { return this.vtable.Present1(this, SyncInterval, PresentFlags, pPresentParameters); }

IDXGISwapChain1_IsTemporaryMonoSupported :: inline (this: *IDXGISwapChain1) -> BOOL { return this.vtable.IsTemporaryMonoSupported(this); }

IDXGISwapChain1_GetRestrictToOutput :: inline (this: *IDXGISwapChain1, ppRestrictToOutput: **IDXGIOutput) -> HRESULT { return this.vtable.GetRestrictToOutput(this, ppRestrictToOutput); }

IDXGISwapChain1_SetBackgroundColor :: inline (this: *IDXGISwapChain1, pColor: *DXGI_RGBA) -> HRESULT { return this.vtable.SetBackgroundColor(this, pColor); }

IDXGISwapChain1_GetBackgroundColor :: inline (this: *IDXGISwapChain1, pColor: *DXGI_RGBA) -> HRESULT { return this.vtable.GetBackgroundColor(this, pColor); }

IDXGISwapChain1_SetRotation :: inline (this: *IDXGISwapChain1, Rotation: DXGI_MODE_ROTATION) -> HRESULT { return this.vtable.SetRotation(this, Rotation); }

IDXGISwapChain1_GetRotation :: inline (this: *IDXGISwapChain1, pRotation: *DXGI_MODE_ROTATION) -> HRESULT { return this.vtable.GetRotation(this, pRotation); }

vtable :: (obj: *IDXGISwapChain1) -> *IDXGISwapChain1_VTable { return obj.vtable; }



IDXGIFactory2_UUID :: "50c83a1c-e072-4c48-87b0-3630fa36a6d0";
IDXGIFactory2 :: struct {
    #as using,except(vtable) idxgifactory1: IDXGIFactory1;

    #overlay (idxgifactory1) vtable: *IDXGIFactory2_VTable; // Overlay parent's vtable with IDXGIFactory2’s vtable
}
IDXGIFactory2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                        IDXGIFactory1_VTable;
    IsWindowedStereoEnabled:       #type (this: *IDXGIFactory2) -> BOOL #cpp_method;
    CreateSwapChainForHwnd:        #type (this: *IDXGIFactory2, pDevice: *IUnknown, hWnd: HWND, pDesc: *DXGI_SWAP_CHAIN_DESC1, pFullscreenDesc: *DXGI_SWAP_CHAIN_FULLSCREEN_DESC, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT #cpp_method;
    CreateSwapChainForCoreWindow:  #type (this: *IDXGIFactory2, pDevice: *IUnknown, pWindow: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT #cpp_method;
    GetSharedResourceAdapterLuid:  #type (this: *IDXGIFactory2, hResource: HANDLE, pLuid: *LUID) -> HRESULT #cpp_method;
    RegisterStereoStatusWindow:    #type (this: *IDXGIFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: *u32) -> HRESULT #cpp_method;
    RegisterStereoStatusEvent:     #type (this: *IDXGIFactory2, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT #cpp_method;
    UnregisterStereoStatus:        #type (this: *IDXGIFactory2, dwCookie: u32) -> void #cpp_method;
    RegisterOcclusionStatusWindow: #type (this: *IDXGIFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: *u32) -> HRESULT #cpp_method;
    RegisterOcclusionStatusEvent:  #type (this: *IDXGIFactory2, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT #cpp_method;
    UnregisterOcclusionStatus:     #type (this: *IDXGIFactory2, dwCookie: u32) -> void #cpp_method;
    CreateSwapChainForComposition: #type (this: *IDXGIFactory2, pDevice: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT #cpp_method;
}
IDXGIFactory2_IsWindowedStereoEnabled :: inline (this: *IDXGIFactory2) -> BOOL { return this.vtable.IsWindowedStereoEnabled(this); }

IDXGIFactory2_CreateSwapChainForHwnd :: inline (this: *IDXGIFactory2, pDevice: *IUnknown, hWnd: HWND, pDesc: *DXGI_SWAP_CHAIN_DESC1, pFullscreenDesc: *DXGI_SWAP_CHAIN_FULLSCREEN_DESC, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT { return this.vtable.CreateSwapChainForHwnd(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain); }

IDXGIFactory2_CreateSwapChainForCoreWindow :: inline (this: *IDXGIFactory2, pDevice: *IUnknown, pWindow: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT { return this.vtable.CreateSwapChainForCoreWindow(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain); }

IDXGIFactory2_GetSharedResourceAdapterLuid :: inline (this: *IDXGIFactory2, hResource: HANDLE, pLuid: *LUID) -> HRESULT { return this.vtable.GetSharedResourceAdapterLuid(this, hResource, pLuid); }

IDXGIFactory2_RegisterStereoStatusWindow :: inline (this: *IDXGIFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterStereoStatusWindow(this, WindowHandle, wMsg, pdwCookie); }

IDXGIFactory2_RegisterStereoStatusEvent :: inline (this: *IDXGIFactory2, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterStereoStatusEvent(this, hEvent, pdwCookie); }

IDXGIFactory2_UnregisterStereoStatus :: inline (this: *IDXGIFactory2, dwCookie: u32) { this.vtable.UnregisterStereoStatus(this, dwCookie); }

IDXGIFactory2_RegisterOcclusionStatusWindow :: inline (this: *IDXGIFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterOcclusionStatusWindow(this, WindowHandle, wMsg, pdwCookie); }

IDXGIFactory2_RegisterOcclusionStatusEvent :: inline (this: *IDXGIFactory2, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterOcclusionStatusEvent(this, hEvent, pdwCookie); }

IDXGIFactory2_UnregisterOcclusionStatus :: inline (this: *IDXGIFactory2, dwCookie: u32) { this.vtable.UnregisterOcclusionStatus(this, dwCookie); }

IDXGIFactory2_CreateSwapChainForComposition :: inline (this: *IDXGIFactory2, pDevice: *IUnknown, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT { return this.vtable.CreateSwapChainForComposition(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain); }

vtable :: (obj: *IDXGIFactory2) -> *IDXGIFactory2_VTable { return obj.vtable; }


DXGI_GRAPHICS_PREEMPTION_GRANULARITY :: enum s32 {
    DMA_BUFFER_BOUNDARY  :: 0;
    PRIMITIVE_BOUNDARY   :: 1;
    TRIANGLE_BOUNDARY    :: 2;
    PIXEL_BOUNDARY       :: 3;
    INSTRUCTION_BOUNDARY :: 4;

    DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY  :: DMA_BUFFER_BOUNDARY;
    DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY   :: PRIMITIVE_BOUNDARY;
    DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY    :: TRIANGLE_BOUNDARY;
    DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY       :: PIXEL_BOUNDARY;
    DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY :: INSTRUCTION_BOUNDARY;
}

DXGI_COMPUTE_PREEMPTION_GRANULARITY :: enum s32 {
    DMA_BUFFER_BOUNDARY   :: 0;
    DISPATCH_BOUNDARY     :: 1;
    THREAD_GROUP_BOUNDARY :: 2;
    THREAD_BOUNDARY       :: 3;
    INSTRUCTION_BOUNDARY  :: 4;

    DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY   :: DMA_BUFFER_BOUNDARY;
    DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY     :: DISPATCH_BOUNDARY;
    DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY :: THREAD_GROUP_BOUNDARY;
    DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY       :: THREAD_BOUNDARY;
    DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY  :: INSTRUCTION_BOUNDARY;
}

DXGI_ADAPTER_DESC2 :: struct {
    Description:                   [128] s16;
    VendorId:                      u32;
    DeviceId:                      u32;
    SubSysId:                      u32;
    Revision:                      u32;
    DedicatedVideoMemory:          SIZE_T;
    DedicatedSystemMemory:         SIZE_T;
    SharedSystemMemory:            SIZE_T;
    AdapterLuid:                   LUID;
    Flags:                         u32;
    GraphicsPreemptionGranularity: DXGI_GRAPHICS_PREEMPTION_GRANULARITY;
    ComputePreemptionGranularity:  DXGI_COMPUTE_PREEMPTION_GRANULARITY;
}


IDXGIAdapter2_UUID :: "0AA1AE0A-FA0E-4B84-8644-E05FF8E5ACB5";
IDXGIAdapter2 :: struct {
    #as using,except(vtable) idxgiadapter1: IDXGIAdapter1;

    #overlay (idxgiadapter1) vtable: *IDXGIAdapter2_VTable; // Overlay parent's vtable with IDXGIAdapter2’s vtable
}
IDXGIAdapter2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:   IDXGIAdapter1_VTable;
    GetDesc2: #type (this: *IDXGIAdapter2, pDesc: *DXGI_ADAPTER_DESC2) -> HRESULT #cpp_method;
}
IDXGIAdapter2_GetDesc2 :: inline (this: *IDXGIAdapter2, pDesc: *DXGI_ADAPTER_DESC2) -> HRESULT { return this.vtable.GetDesc2(this, pDesc); }

vtable :: (obj: *IDXGIAdapter2) -> *IDXGIAdapter2_VTable { return obj.vtable; }



IDXGIOutput1_UUID :: "00cddea8-939b-4b83-a340-a685226666cc";
IDXGIOutput1 :: struct {
    #as using,except(vtable) idxgioutput: IDXGIOutput;

    #overlay (idxgioutput) vtable: *IDXGIOutput1_VTable; // Overlay parent's vtable with IDXGIOutput1’s vtable
}
IDXGIOutput1_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                   IDXGIOutput_VTable;
    GetDisplayModeList1:      #type (this: *IDXGIOutput1, EnumFormat: DXGI_FORMAT, Flags: u32, pNumModes: *u32, pDesc: *DXGI_MODE_DESC1) -> HRESULT #cpp_method;
    FindClosestMatchingMode1: #type (this: *IDXGIOutput1, pModeToMatch: *DXGI_MODE_DESC1, pClosestMatch: *DXGI_MODE_DESC1, pConcernedDevice: *IUnknown) -> HRESULT #cpp_method;
    GetDisplaySurfaceData1:   #type (this: *IDXGIOutput1, pDestination: *IDXGIResource) -> HRESULT #cpp_method;
    DuplicateOutput:          #type (this: *IDXGIOutput1, pDevice: *IUnknown, ppOutputDuplication: **IDXGIOutputDuplication) -> HRESULT #cpp_method;
}
IDXGIOutput1_GetDisplayModeList1 :: inline (this: *IDXGIOutput1, EnumFormat: DXGI_FORMAT, Flags: u32, pNumModes: *u32, pDesc: *DXGI_MODE_DESC1) -> HRESULT { return this.vtable.GetDisplayModeList1(this, EnumFormat, Flags, pNumModes, pDesc); }

IDXGIOutput1_FindClosestMatchingMode1 :: inline (this: *IDXGIOutput1, pModeToMatch: *DXGI_MODE_DESC1, pClosestMatch: *DXGI_MODE_DESC1, pConcernedDevice: *IUnknown) -> HRESULT { return this.vtable.FindClosestMatchingMode1(this, pModeToMatch, pClosestMatch, pConcernedDevice); }

IDXGIOutput1_GetDisplaySurfaceData1 :: inline (this: *IDXGIOutput1, pDestination: *IDXGIResource) -> HRESULT { return this.vtable.GetDisplaySurfaceData1(this, pDestination); }

IDXGIOutput1_DuplicateOutput :: inline (this: *IDXGIOutput1, pDevice: *IUnknown, ppOutputDuplication: **IDXGIOutputDuplication) -> HRESULT { return this.vtable.DuplicateOutput(this, pDevice, ppOutputDuplication); }

vtable :: (obj: *IDXGIOutput1) -> *IDXGIOutput1_VTable { return obj.vtable; }


CreateDXGIFactory2 :: (Flags: u32, riid: *IID, ppFactory: **void) -> HRESULT #foreign dxgi;
CreateDXGIFactory2 :: (Flags: u32, riid: IID, ppFactory: **void) -> HRESULT #no_context {
    return CreateDXGIFactory2(Flags, *riid, ppFactory);
}
DXGIGetDebugInterface1 :: (Flags: u32, riid: *IID, pDebug: **void) -> HRESULT #foreign dxgi;
DXGIGetDebugInterface1 :: (Flags: u32, riid: IID, pDebug: **void) -> HRESULT #no_context {
    return DXGIGetDebugInterface1(Flags, *riid, pDebug);
}


IDXGIDevice3_UUID :: "6007896c-3244-4afd-bf18-a6d3beda5023";
IDXGIDevice3 :: struct {
    #as using,except(vtable) idxgidevice2: IDXGIDevice2;

    #overlay (idxgidevice2) vtable: *IDXGIDevice3_VTable; // Overlay parent's vtable with IDXGIDevice3’s vtable
}
IDXGIDevice3_VTable :: struct #type_info_none {
    using,except(vtable) vtable: IDXGIDevice2_VTable;
    Trim:   #type (this: *IDXGIDevice3) -> void #cpp_method;
}
IDXGIDevice3_Trim :: inline (this: *IDXGIDevice3) { this.vtable.Trim(this); }

vtable :: (obj: *IDXGIDevice3) -> *IDXGIDevice3_VTable { return obj.vtable; }


DXGI_MATRIX_3X2_F :: struct {
    _11: float;
    _12: float;
    _21: float;
    _22: float;
    _31: float;
    _32: float;
}


IDXGISwapChain2_UUID :: "a8be2ac4-199f-4946-b331-79599fb98de7";
IDXGISwapChain2 :: struct {
    #as using,except(vtable) idxgiswapchain1: IDXGISwapChain1;

    #overlay (idxgiswapchain1) vtable: *IDXGISwapChain2_VTable; // Overlay parent's vtable with IDXGISwapChain2’s vtable
}
IDXGISwapChain2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                        IDXGISwapChain1_VTable;
    SetSourceSize:                 #type (this: *IDXGISwapChain2, Width: u32, Height: u32) -> HRESULT #cpp_method;
    GetSourceSize:                 #type (this: *IDXGISwapChain2, pWidth: *u32, pHeight: *u32) -> HRESULT #cpp_method;
    SetMaximumFrameLatency:        #type (this: *IDXGISwapChain2, MaxLatency: u32) -> HRESULT #cpp_method;
    GetMaximumFrameLatency:        #type (this: *IDXGISwapChain2, pMaxLatency: *u32) -> HRESULT #cpp_method;
    GetFrameLatencyWaitableObject: #type (this: *IDXGISwapChain2) -> HANDLE #cpp_method;
    SetMatrixTransform:            #type (this: *IDXGISwapChain2, pMatrix: *DXGI_MATRIX_3X2_F) -> HRESULT #cpp_method;
    GetMatrixTransform:            #type (this: *IDXGISwapChain2, pMatrix: *DXGI_MATRIX_3X2_F) -> HRESULT #cpp_method;
}
IDXGISwapChain2_SetSourceSize :: inline (this: *IDXGISwapChain2, Width: u32, Height: u32) -> HRESULT { return this.vtable.SetSourceSize(this, Width, Height); }

IDXGISwapChain2_GetSourceSize :: inline (this: *IDXGISwapChain2, pWidth: *u32, pHeight: *u32) -> HRESULT { return this.vtable.GetSourceSize(this, pWidth, pHeight); }

IDXGISwapChain2_SetMaximumFrameLatency :: inline (this: *IDXGISwapChain2, MaxLatency: u32) -> HRESULT { return this.vtable.SetMaximumFrameLatency(this, MaxLatency); }

IDXGISwapChain2_GetMaximumFrameLatency :: inline (this: *IDXGISwapChain2, pMaxLatency: *u32) -> HRESULT { return this.vtable.GetMaximumFrameLatency(this, pMaxLatency); }

IDXGISwapChain2_GetFrameLatencyWaitableObject :: inline (this: *IDXGISwapChain2) -> HANDLE { return this.vtable.GetFrameLatencyWaitableObject(this); }

IDXGISwapChain2_SetMatrixTransform :: inline (this: *IDXGISwapChain2, pMatrix: *DXGI_MATRIX_3X2_F) -> HRESULT { return this.vtable.SetMatrixTransform(this, pMatrix); }

IDXGISwapChain2_GetMatrixTransform :: inline (this: *IDXGISwapChain2, pMatrix: *DXGI_MATRIX_3X2_F) -> HRESULT { return this.vtable.GetMatrixTransform(this, pMatrix); }

vtable :: (obj: *IDXGISwapChain2) -> *IDXGISwapChain2_VTable { return obj.vtable; }



IDXGIOutput2_UUID :: "595e39d1-2724-4663-99b1-da969de28364";
IDXGIOutput2 :: struct {
    #as using,except(vtable) idxgioutput1: IDXGIOutput1;

    #overlay (idxgioutput1) vtable: *IDXGIOutput2_VTable; // Overlay parent's vtable with IDXGIOutput2’s vtable
}
IDXGIOutput2_VTable :: struct #type_info_none {
    using,except(vtable) vtable:           IDXGIOutput1_VTable;
    SupportsOverlays: #type (this: *IDXGIOutput2) -> BOOL #cpp_method;
}
IDXGIOutput2_SupportsOverlays :: inline (this: *IDXGIOutput2) -> BOOL { return this.vtable.SupportsOverlays(this); }

vtable :: (obj: *IDXGIOutput2) -> *IDXGIOutput2_VTable { return obj.vtable; }



IDXGIFactory3_UUID :: "25483823-cd46-4c7d-86ca-47aa95b837bd";
IDXGIFactory3 :: struct {
    #as using,except(vtable) idxgifactory2: IDXGIFactory2;

    #overlay (idxgifactory2) vtable: *IDXGIFactory3_VTable; // Overlay parent's vtable with IDXGIFactory3’s vtable
}
IDXGIFactory3_VTable :: struct #type_info_none {
    using,except(vtable) vtable:           IDXGIFactory2_VTable;
    GetCreationFlags: #type (this: *IDXGIFactory3) -> u32 #cpp_method;
}
IDXGIFactory3_GetCreationFlags :: inline (this: *IDXGIFactory3) -> u32 { return this.vtable.GetCreationFlags(this); }

vtable :: (obj: *IDXGIFactory3) -> *IDXGIFactory3_VTable { return obj.vtable; }


DXGI_DECODE_SWAP_CHAIN_DESC :: struct {
    Flags: u32;
}

DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS :: enum_flags u32 {
    NOMINAL_RANGE :: 0x1;
    BT709         :: 0x2;
    xvYCC         :: 0x4;

    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE :: NOMINAL_RANGE;
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709         :: BT709;
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC         :: xvYCC;
}


IDXGIDecodeSwapChain_UUID :: "2633066b-4514-4c7a-8fd8-12ea98059d18";
IDXGIDecodeSwapChain :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIDecodeSwapChain_VTable; // Overlay parent's vtable with IDXGIDecodeSwapChain’s vtable
}
IDXGIDecodeSwapChain_VTable :: struct #type_info_none {
    using vtable:  IUnknown_VTable;
    PresentBuffer: #type (this: *IDXGIDecodeSwapChain, BufferToPresent: u32, SyncInterval: u32, Flags: u32) -> HRESULT #cpp_method;
    SetSourceRect: #type (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT #cpp_method;
    SetTargetRect: #type (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT #cpp_method;
    SetDestSize:   #type (this: *IDXGIDecodeSwapChain, Width: u32, Height: u32) -> HRESULT #cpp_method;
    GetSourceRect: #type (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT #cpp_method;
    GetTargetRect: #type (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT #cpp_method;
    GetDestSize:   #type (this: *IDXGIDecodeSwapChain, pWidth: *u32, pHeight: *u32) -> HRESULT #cpp_method;
    SetColorSpace: #type (this: *IDXGIDecodeSwapChain, ColorSpace: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS) -> HRESULT #cpp_method;
    GetColorSpace: #type (this: *IDXGIDecodeSwapChain) -> DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS #cpp_method;
}
IDXGIDecodeSwapChain_PresentBuffer :: inline (this: *IDXGIDecodeSwapChain, BufferToPresent: u32, SyncInterval: u32, Flags: u32) -> HRESULT { return this.vtable.PresentBuffer(this, BufferToPresent, SyncInterval, Flags); }

IDXGIDecodeSwapChain_SetSourceRect :: inline (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT { return this.vtable.SetSourceRect(this, pRect); }

IDXGIDecodeSwapChain_SetTargetRect :: inline (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT { return this.vtable.SetTargetRect(this, pRect); }

IDXGIDecodeSwapChain_SetDestSize :: inline (this: *IDXGIDecodeSwapChain, Width: u32, Height: u32) -> HRESULT { return this.vtable.SetDestSize(this, Width, Height); }

IDXGIDecodeSwapChain_GetSourceRect :: inline (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT { return this.vtable.GetSourceRect(this, pRect); }

IDXGIDecodeSwapChain_GetTargetRect :: inline (this: *IDXGIDecodeSwapChain, pRect: *RECT) -> HRESULT { return this.vtable.GetTargetRect(this, pRect); }

IDXGIDecodeSwapChain_GetDestSize :: inline (this: *IDXGIDecodeSwapChain, pWidth: *u32, pHeight: *u32) -> HRESULT { return this.vtable.GetDestSize(this, pWidth, pHeight); }

IDXGIDecodeSwapChain_SetColorSpace :: inline (this: *IDXGIDecodeSwapChain, ColorSpace: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS) -> HRESULT { return this.vtable.SetColorSpace(this, ColorSpace); }

IDXGIDecodeSwapChain_GetColorSpace :: inline (this: *IDXGIDecodeSwapChain) -> DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS { return this.vtable.GetColorSpace(this); }

vtable :: (obj: *IDXGIDecodeSwapChain) -> *IDXGIDecodeSwapChain_VTable { return obj.vtable; }



IDXGIFactoryMedia_UUID :: "41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12";
IDXGIFactoryMedia :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGIFactoryMedia_VTable; // Overlay parent's vtable with IDXGIFactoryMedia’s vtable
}
IDXGIFactoryMedia_VTable :: struct #type_info_none {
    using vtable:                                     IUnknown_VTable;
    CreateSwapChainForCompositionSurfaceHandle:       #type (this: *IDXGIFactoryMedia, pDevice: *IUnknown, hSurface: HANDLE, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT #cpp_method;
    CreateDecodeSwapChainForCompositionSurfaceHandle: #type (this: *IDXGIFactoryMedia, pDevice: *IUnknown, hSurface: HANDLE, pDesc: *DXGI_DECODE_SWAP_CHAIN_DESC, pYuvDecodeBuffers: *IDXGIResource, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGIDecodeSwapChain) -> HRESULT #cpp_method;
}
IDXGIFactoryMedia_CreateSwapChainForCompositionSurfaceHandle :: inline (this: *IDXGIFactoryMedia, pDevice: *IUnknown, hSurface: HANDLE, pDesc: *DXGI_SWAP_CHAIN_DESC1, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGISwapChain1) -> HRESULT { return this.vtable.CreateSwapChainForCompositionSurfaceHandle(this, pDevice, hSurface, pDesc, pRestrictToOutput, ppSwapChain); }

IDXGIFactoryMedia_CreateDecodeSwapChainForCompositionSurfaceHandle :: inline (this: *IDXGIFactoryMedia, pDevice: *IUnknown, hSurface: HANDLE, pDesc: *DXGI_DECODE_SWAP_CHAIN_DESC, pYuvDecodeBuffers: *IDXGIResource, pRestrictToOutput: *IDXGIOutput, ppSwapChain: **IDXGIDecodeSwapChain) -> HRESULT { return this.vtable.CreateDecodeSwapChainForCompositionSurfaceHandle(this, pDevice, hSurface, pDesc, pYuvDecodeBuffers, pRestrictToOutput, ppSwapChain); }

vtable :: (obj: *IDXGIFactoryMedia) -> *IDXGIFactoryMedia_VTable { return obj.vtable; }


DXGI_FRAME_PRESENTATION_MODE :: enum s32 {
    COMPOSED            :: 0;
    OVERLAY             :: 1;
    NONE                :: 2;
    COMPOSITION_FAILURE :: 3;

    DXGI_FRAME_PRESENTATION_MODE_COMPOSED            :: COMPOSED;
    DXGI_FRAME_PRESENTATION_MODE_OVERLAY             :: OVERLAY;
    DXGI_FRAME_PRESENTATION_MODE_NONE                :: NONE;
    DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE :: COMPOSITION_FAILURE;
}

DXGI_FRAME_STATISTICS_MEDIA :: struct {
    PresentCount:            u32;
    PresentRefreshCount:     u32;
    SyncRefreshCount:        u32;
    SyncQPCTime:             LARGE_INTEGER;
    SyncGPUTime:             LARGE_INTEGER;
    CompositionMode:         DXGI_FRAME_PRESENTATION_MODE;
    ApprovedPresentDuration: u32;
}


IDXGISwapChainMedia_UUID :: "dd95b90b-f05f-4f6a-bd65-25bfb264bd84";
IDXGISwapChainMedia :: struct {
    #as using,except(vtable) iunknown: IUnknown;

    #overlay (iunknown) vtable: *IDXGISwapChainMedia_VTable; // Overlay parent's vtable with IDXGISwapChainMedia’s vtable
}
IDXGISwapChainMedia_VTable :: struct #type_info_none {
    using vtable:                IUnknown_VTable;
    GetFrameStatisticsMedia:     #type (this: *IDXGISwapChainMedia, pStats: *DXGI_FRAME_STATISTICS_MEDIA) -> HRESULT #cpp_method;
    SetPresentDuration:          #type (this: *IDXGISwapChainMedia, Duration: u32) -> HRESULT #cpp_method;
    CheckPresentDurationSupport: #type (this: *IDXGISwapChainMedia, DesiredPresentDuration: u32, pClosestSmallerPresentDuration: *u32, pClosestLargerPresentDuration: *u32) -> HRESULT #cpp_method;
}
IDXGISwapChainMedia_GetFrameStatisticsMedia :: inline (this: *IDXGISwapChainMedia, pStats: *DXGI_FRAME_STATISTICS_MEDIA) -> HRESULT { return this.vtable.GetFrameStatisticsMedia(this, pStats); }

IDXGISwapChainMedia_SetPresentDuration :: inline (this: *IDXGISwapChainMedia, Duration: u32) -> HRESULT { return this.vtable.SetPresentDuration(this, Duration); }

IDXGISwapChainMedia_CheckPresentDurationSupport :: inline (this: *IDXGISwapChainMedia, DesiredPresentDuration: u32, pClosestSmallerPresentDuration: *u32, pClosestLargerPresentDuration: *u32) -> HRESULT { return this.vtable.CheckPresentDurationSupport(this, DesiredPresentDuration, pClosestSmallerPresentDuration, pClosestLargerPresentDuration); }

vtable :: (obj: *IDXGISwapChainMedia) -> *IDXGISwapChainMedia_VTable { return obj.vtable; }


DXGI_OVERLAY_SUPPORT_FLAG :: enum_flags u32 {
    DIRECT  :: 0x1;
    SCALING :: 0x2;

    DXGI_OVERLAY_SUPPORT_FLAG_DIRECT  :: DIRECT;
    DXGI_OVERLAY_SUPPORT_FLAG_SCALING :: SCALING;
}


IDXGIOutput3_UUID :: "8a6bb301-7e7e-41F4-a8e0-5b32f7f99b18";
IDXGIOutput3 :: struct {
    #as using,except(vtable) idxgioutput2: IDXGIOutput2;

    #overlay (idxgioutput2) vtable: *IDXGIOutput3_VTable; // Overlay parent's vtable with IDXGIOutput3’s vtable
}
IDXGIOutput3_VTable :: struct #type_info_none {
    using,except(vtable) vtable:              IDXGIOutput2_VTable;
    CheckOverlaySupport: #type (this: *IDXGIOutput3, EnumFormat: DXGI_FORMAT, pConcernedDevice: *IUnknown, pFlags: *u32) -> HRESULT #cpp_method;
}
IDXGIOutput3_CheckOverlaySupport :: inline (this: *IDXGIOutput3, EnumFormat: DXGI_FORMAT, pConcernedDevice: *IUnknown, pFlags: *u32) -> HRESULT { return this.vtable.CheckOverlaySupport(this, EnumFormat, pConcernedDevice, pFlags); }

vtable :: (obj: *IDXGIOutput3) -> *IDXGIOutput3_VTable { return obj.vtable; }


DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG :: enum_flags u32 {
    PRESENT         :: 0x1;
    OVERLAY_PRESENT :: 0x2;

    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT         :: PRESENT;
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT :: OVERLAY_PRESENT;
}


IDXGISwapChain3_UUID :: "94d99bdb-f1f8-4ab0-b236-7da0170edab1";
IDXGISwapChain3 :: struct {
    #as using,except(vtable) idxgiswapchain2: IDXGISwapChain2;

    #overlay (idxgiswapchain2) vtable: *IDXGISwapChain3_VTable; // Overlay parent's vtable with IDXGISwapChain3’s vtable
}
IDXGISwapChain3_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                    IDXGISwapChain2_VTable;
    GetCurrentBackBufferIndex: #type (this: *IDXGISwapChain3) -> u32 #cpp_method;
    CheckColorSpaceSupport:    #type (this: *IDXGISwapChain3, ColorSpace: DXGI_COLOR_SPACE_TYPE, pColorSpaceSupport: *u32) -> HRESULT #cpp_method;
    SetColorSpace1:            #type (this: *IDXGISwapChain3, ColorSpace: DXGI_COLOR_SPACE_TYPE) -> HRESULT #cpp_method;
    ResizeBuffers1:            #type (this: *IDXGISwapChain3, BufferCount: u32, Width: u32, Height: u32, Format: DXGI_FORMAT, SwapChainFlags: u32, pCreationNodeMask: *u32, ppPresentQueue: **IUnknown) -> HRESULT #cpp_method;
}
IDXGISwapChain3_GetCurrentBackBufferIndex :: inline (this: *IDXGISwapChain3) -> u32 { return this.vtable.GetCurrentBackBufferIndex(this); }

IDXGISwapChain3_CheckColorSpaceSupport :: inline (this: *IDXGISwapChain3, ColorSpace: DXGI_COLOR_SPACE_TYPE, pColorSpaceSupport: *u32) -> HRESULT { return this.vtable.CheckColorSpaceSupport(this, ColorSpace, pColorSpaceSupport); }

IDXGISwapChain3_SetColorSpace1 :: inline (this: *IDXGISwapChain3, ColorSpace: DXGI_COLOR_SPACE_TYPE) -> HRESULT { return this.vtable.SetColorSpace1(this, ColorSpace); }

IDXGISwapChain3_ResizeBuffers1 :: inline (this: *IDXGISwapChain3, BufferCount: u32, Width: u32, Height: u32, Format: DXGI_FORMAT, SwapChainFlags: u32, pCreationNodeMask: *u32, ppPresentQueue: **IUnknown) -> HRESULT { return this.vtable.ResizeBuffers1(this, BufferCount, Width, Height, Format, SwapChainFlags, pCreationNodeMask, ppPresentQueue); }

vtable :: (obj: *IDXGISwapChain3) -> *IDXGISwapChain3_VTable { return obj.vtable; }


DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG :: enum_flags u32 {
    PRESENT :: 0x1;
    DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT :: PRESENT;
}


IDXGIOutput4_UUID :: "dc7dca35-2196-414d-9F53-617884032a60";
IDXGIOutput4 :: struct {
    #as using,except(vtable) idxgioutput3: IDXGIOutput3;

    #overlay (idxgioutput3) vtable: *IDXGIOutput4_VTable; // Overlay parent's vtable with IDXGIOutput4’s vtable
}
IDXGIOutput4_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                        IDXGIOutput3_VTable;
    CheckOverlayColorSpaceSupport: #type (this: *IDXGIOutput4, Format: DXGI_FORMAT, ColorSpace: DXGI_COLOR_SPACE_TYPE, pConcernedDevice: *IUnknown, pFlags: *u32) -> HRESULT #cpp_method;
}
IDXGIOutput4_CheckOverlayColorSpaceSupport :: inline (this: *IDXGIOutput4, Format: DXGI_FORMAT, ColorSpace: DXGI_COLOR_SPACE_TYPE, pConcernedDevice: *IUnknown, pFlags: *u32) -> HRESULT { return this.vtable.CheckOverlayColorSpaceSupport(this, Format, ColorSpace, pConcernedDevice, pFlags); }

vtable :: (obj: *IDXGIOutput4) -> *IDXGIOutput4_VTable { return obj.vtable; }



IDXGIFactory4_UUID :: "1bc6ea02-ef36-464f-bf0c-21ca39e5168a";
IDXGIFactory4 :: struct {
    #as using,except(vtable) idxgifactory3: IDXGIFactory3;

    #overlay (idxgifactory3) vtable: *IDXGIFactory4_VTable; // Overlay parent's vtable with IDXGIFactory4’s vtable
}
IDXGIFactory4_VTable :: struct #type_info_none {
    using,except(vtable) vtable:            IDXGIFactory3_VTable;
    EnumAdapterByLuid: #type (this: *IDXGIFactory4, AdapterLuid: LUID, riid: *IID, ppvAdapter: **void) -> HRESULT #cpp_method;
    EnumWarpAdapter:   #type (this: *IDXGIFactory4, riid: *IID, ppvAdapter: **void) -> HRESULT #cpp_method;
}
IDXGIFactory4_EnumAdapterByLuid :: inline (this: *IDXGIFactory4, AdapterLuid: LUID, riid: *IID, ppvAdapter: **void) -> HRESULT { return this.vtable.EnumAdapterByLuid(this, AdapterLuid, riid, ppvAdapter); }

IDXGIFactory4_EnumWarpAdapter :: inline (this: *IDXGIFactory4, riid: *IID, ppvAdapter: **void) -> HRESULT { return this.vtable.EnumWarpAdapter(this, riid, ppvAdapter); }

vtable :: (obj: *IDXGIFactory4) -> *IDXGIFactory4_VTable { return obj.vtable; }


DXGI_MEMORY_SEGMENT_GROUP :: enum s32 {
    LOCAL     :: 0;
    NON_LOCAL :: 1;

    DXGI_MEMORY_SEGMENT_GROUP_LOCAL     :: LOCAL;
    DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL :: NON_LOCAL;
}

DXGI_QUERY_VIDEO_MEMORY_INFO :: struct {
    Budget:                  u64;
    CurrentUsage:            u64;
    AvailableForReservation: u64;
    CurrentReservation:      u64;
}


IDXGIAdapter3_UUID :: "645967A4-1392-4310-A798-8053CE3E93FD";
IDXGIAdapter3 :: struct {
    #as using,except(vtable) idxgiadapter2: IDXGIAdapter2;

    #overlay (idxgiadapter2) vtable: *IDXGIAdapter3_VTable; // Overlay parent's vtable with IDXGIAdapter3’s vtable
}
IDXGIAdapter3_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                                               IDXGIAdapter2_VTable;
    RegisterHardwareContentProtectionTeardownStatusEvent: #type (this: *IDXGIAdapter3, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT #cpp_method;
    UnregisterHardwareContentProtectionTeardownStatus:    #type (this: *IDXGIAdapter3, dwCookie: u32) -> void #cpp_method;
    QueryVideoMemoryInfo:                                 #type (this: *IDXGIAdapter3, NodeIndex: u32, MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP, pVideoMemoryInfo: *DXGI_QUERY_VIDEO_MEMORY_INFO) -> HRESULT #cpp_method;
    SetVideoMemoryReservation:                            #type (this: *IDXGIAdapter3, NodeIndex: u32, MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP, Reservation: u64) -> HRESULT #cpp_method;
    RegisterVideoMemoryBudgetChangeNotificationEvent:     #type (this: *IDXGIAdapter3, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT #cpp_method;
    UnregisterVideoMemoryBudgetChangeNotification:        #type (this: *IDXGIAdapter3, dwCookie: u32) -> void #cpp_method;
}
IDXGIAdapter3_RegisterHardwareContentProtectionTeardownStatusEvent :: inline (this: *IDXGIAdapter3, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterHardwareContentProtectionTeardownStatusEvent(this, hEvent, pdwCookie); }

IDXGIAdapter3_UnregisterHardwareContentProtectionTeardownStatus :: inline (this: *IDXGIAdapter3, dwCookie: u32) { this.vtable.UnregisterHardwareContentProtectionTeardownStatus(this, dwCookie); }

IDXGIAdapter3_QueryVideoMemoryInfo :: inline (this: *IDXGIAdapter3, NodeIndex: u32, MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP, pVideoMemoryInfo: *DXGI_QUERY_VIDEO_MEMORY_INFO) -> HRESULT { return this.vtable.QueryVideoMemoryInfo(this, NodeIndex, MemorySegmentGroup, pVideoMemoryInfo); }

IDXGIAdapter3_SetVideoMemoryReservation :: inline (this: *IDXGIAdapter3, NodeIndex: u32, MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP, Reservation: u64) -> HRESULT { return this.vtable.SetVideoMemoryReservation(this, NodeIndex, MemorySegmentGroup, Reservation); }

IDXGIAdapter3_RegisterVideoMemoryBudgetChangeNotificationEvent :: inline (this: *IDXGIAdapter3, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterVideoMemoryBudgetChangeNotificationEvent(this, hEvent, pdwCookie); }

IDXGIAdapter3_UnregisterVideoMemoryBudgetChangeNotification :: inline (this: *IDXGIAdapter3, dwCookie: u32) { this.vtable.UnregisterVideoMemoryBudgetChangeNotification(this, dwCookie); }

vtable :: (obj: *IDXGIAdapter3) -> *IDXGIAdapter3_VTable { return obj.vtable; }


DXGI_OUTDUPL_FLAG :: enum_flags u32 {
    DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY :: 0x1;
}


IDXGIOutput5_UUID :: "80A07424-AB52-42EB-833C-0C42FD282D98";
IDXGIOutput5 :: struct {
    #as using,except(vtable) idxgioutput4: IDXGIOutput4;

    #overlay (idxgioutput4) vtable: *IDXGIOutput5_VTable; // Overlay parent's vtable with IDXGIOutput5’s vtable
}
IDXGIOutput5_VTable :: struct #type_info_none {
    using,except(vtable) vtable:           IDXGIOutput4_VTable;
    DuplicateOutput1: #type (this: *IDXGIOutput5, pDevice: *IUnknown, Flags: u32, SupportedFormatsCount: u32, pSupportedFormats: *DXGI_FORMAT, ppOutputDuplication: **IDXGIOutputDuplication) -> HRESULT #cpp_method;
}
IDXGIOutput5_DuplicateOutput1 :: inline (this: *IDXGIOutput5, pDevice: *IUnknown, Flags: u32, SupportedFormatsCount: u32, pSupportedFormats: *DXGI_FORMAT, ppOutputDuplication: **IDXGIOutputDuplication) -> HRESULT { return this.vtable.DuplicateOutput1(this, pDevice, Flags, SupportedFormatsCount, pSupportedFormats, ppOutputDuplication); }

vtable :: (obj: *IDXGIOutput5) -> *IDXGIOutput5_VTable { return obj.vtable; }


DXGI_HDR_METADATA_TYPE :: enum s32 {
    NONE      :: 0;
    HDR10     :: 1;
    HDR10PLUS :: 2;

    DXGI_HDR_METADATA_TYPE_NONE      :: NONE;
    DXGI_HDR_METADATA_TYPE_HDR10     :: HDR10;
    DXGI_HDR_METADATA_TYPE_HDR10PLUS :: HDR10PLUS;
}

DXGI_HDR_METADATA_HDR10 :: struct {
    RedPrimary:                [2] u16;
    GreenPrimary:              [2] u16;
    BluePrimary:               [2] u16;
    WhitePoint:                [2] u16;
    MaxMasteringLuminance:     u32;
    MinMasteringLuminance:     u32;
    MaxContentLightLevel:      u16;
    MaxFrameAverageLightLevel: u16;
}

DXGI_HDR_METADATA_HDR10PLUS :: struct {
    Data: [72] u8;
}


IDXGISwapChain4_UUID :: "3D585D5A-BD4A-489E-B1F4-3DBCB6452FFB";
IDXGISwapChain4 :: struct {
    #as using,except(vtable) idxgiswapchain3: IDXGISwapChain3;

    #overlay (idxgiswapchain3) vtable: *IDXGISwapChain4_VTable; // Overlay parent's vtable with IDXGISwapChain4’s vtable
}
IDXGISwapChain4_VTable :: struct #type_info_none {
    using,except(vtable) vtable:         IDXGISwapChain3_VTable;
    SetHDRMetaData: #type (this: *IDXGISwapChain4, Type: DXGI_HDR_METADATA_TYPE, Size: u32, pMetaData: *void) -> HRESULT #cpp_method;
}
IDXGISwapChain4_SetHDRMetaData :: inline (this: *IDXGISwapChain4, Type: DXGI_HDR_METADATA_TYPE, Size: u32, pMetaData: *void) -> HRESULT { return this.vtable.SetHDRMetaData(this, Type, Size, pMetaData); }

vtable :: (obj: *IDXGISwapChain4) -> *IDXGISwapChain4_VTable { return obj.vtable; }


DXGI_OFFER_RESOURCE_FLAGS :: enum_flags u32 {
    DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT :: 0x1;
}

DXGI_RECLAIM_RESOURCE_RESULTS :: enum s32 {
    OK            :: 0;
    DISCARDED     :: 1;
    NOT_COMMITTED :: 2;

    DXGI_RECLAIM_RESOURCE_RESULT_OK            :: OK;
    DXGI_RECLAIM_RESOURCE_RESULT_DISCARDED     :: DISCARDED;
    DXGI_RECLAIM_RESOURCE_RESULT_NOT_COMMITTED :: NOT_COMMITTED;
}


IDXGIDevice4_UUID :: "95B4F95F-D8DA-4CA4-9EE6-3B76D5968A10";
IDXGIDevice4 :: struct {
    #as using,except(vtable) idxgidevice3: IDXGIDevice3;

    #overlay (idxgidevice3) vtable: *IDXGIDevice4_VTable; // Overlay parent's vtable with IDXGIDevice4’s vtable
}
IDXGIDevice4_VTable :: struct #type_info_none {
    using,except(vtable) vtable:            IDXGIDevice3_VTable;
    OfferResources1:   #type (this: *IDXGIDevice4, NumResources: u32, ppResources: **IDXGIResource, Priority: DXGI_OFFER_RESOURCE_PRIORITY, Flags: u32) -> HRESULT #cpp_method;
    ReclaimResources1: #type (this: *IDXGIDevice4, NumResources: u32, ppResources: **IDXGIResource, pResults: *DXGI_RECLAIM_RESOURCE_RESULTS) -> HRESULT #cpp_method;
}
IDXGIDevice4_OfferResources1 :: inline (this: *IDXGIDevice4, NumResources: u32, ppResources: **IDXGIResource, Priority: DXGI_OFFER_RESOURCE_PRIORITY, Flags: u32) -> HRESULT { return this.vtable.OfferResources1(this, NumResources, ppResources, Priority, Flags); }

IDXGIDevice4_ReclaimResources1 :: inline (this: *IDXGIDevice4, NumResources: u32, ppResources: **IDXGIResource, pResults: *DXGI_RECLAIM_RESOURCE_RESULTS) -> HRESULT { return this.vtable.ReclaimResources1(this, NumResources, ppResources, pResults); }

vtable :: (obj: *IDXGIDevice4) -> *IDXGIDevice4_VTable { return obj.vtable; }


DXGI_FEATURE :: enum s32 {
    PRESENT_ALLOW_TEARING :: 0;
    DXGI_FEATURE_PRESENT_ALLOW_TEARING :: PRESENT_ALLOW_TEARING;
}


IDXGIFactory5_UUID :: "7632e1f5-ee65-4dca-87fd-84cd75f8838d";
IDXGIFactory5 :: struct {
    #as using,except(vtable) idxgifactory4: IDXGIFactory4;

    #overlay (idxgifactory4) vtable: *IDXGIFactory5_VTable; // Overlay parent's vtable with IDXGIFactory5’s vtable
}
IDXGIFactory5_VTable :: struct #type_info_none {
    using,except(vtable) vtable:              IDXGIFactory4_VTable;
    CheckFeatureSupport: #type (this: *IDXGIFactory5, Feature: DXGI_FEATURE, pFeatureSupportData: *void, FeatureSupportDataSize: u32) -> HRESULT #cpp_method;
}
IDXGIFactory5_CheckFeatureSupport :: inline (this: *IDXGIFactory5, Feature: DXGI_FEATURE, pFeatureSupportData: *void, FeatureSupportDataSize: u32) -> HRESULT { return this.vtable.CheckFeatureSupport(this, Feature, pFeatureSupportData, FeatureSupportDataSize); }

vtable :: (obj: *IDXGIFactory5) -> *IDXGIFactory5_VTable { return obj.vtable; }


DXGIDeclareAdapterRemovalSupport :: () -> HRESULT #foreign dxgi;

DXGI_ADAPTER_FLAG3 :: enum s32 {
    NONE                         :: 0;
    REMOTE                       :: 1;
    SOFTWARE                     :: 2;
    ACG_COMPATIBLE               :: 4;
    SUPPORT_MONITORED_FENCES     :: 8;
    SUPPORT_NON_MONITORED_FENCES :: 16;
    KEYED_MUTEX_CONFORMANCE      :: 32;
    FORCE_DWORD                  :: -1;

    DXGI_ADAPTER_FLAG3_NONE                         :: NONE;
    DXGI_ADAPTER_FLAG3_REMOTE                       :: REMOTE;
    DXGI_ADAPTER_FLAG3_SOFTWARE                     :: SOFTWARE;
    DXGI_ADAPTER_FLAG3_ACG_COMPATIBLE               :: ACG_COMPATIBLE;
    DXGI_ADAPTER_FLAG3_SUPPORT_MONITORED_FENCES     :: SUPPORT_MONITORED_FENCES;
    DXGI_ADAPTER_FLAG3_SUPPORT_NON_MONITORED_FENCES :: SUPPORT_NON_MONITORED_FENCES;
    DXGI_ADAPTER_FLAG3_KEYED_MUTEX_CONFORMANCE      :: KEYED_MUTEX_CONFORMANCE;
    DXGI_ADAPTER_FLAG3_FORCE_DWORD                  :: FORCE_DWORD;
}

DXGI_ADAPTER_DESC3 :: struct {
    Description:                   [128] s16;
    VendorId:                      u32;
    DeviceId:                      u32;
    SubSysId:                      u32;
    Revision:                      u32;
    DedicatedVideoMemory:          SIZE_T;
    DedicatedSystemMemory:         SIZE_T;
    SharedSystemMemory:            SIZE_T;
    AdapterLuid:                   LUID;
    Flags:                         DXGI_ADAPTER_FLAG3;
    GraphicsPreemptionGranularity: DXGI_GRAPHICS_PREEMPTION_GRANULARITY;
    ComputePreemptionGranularity:  DXGI_COMPUTE_PREEMPTION_GRANULARITY;
}


IDXGIAdapter4_UUID :: "3c8d99d1-4fbf-4181-a82c-af66bf7bd24e";
IDXGIAdapter4 :: struct {
    #as using,except(vtable) idxgiadapter3: IDXGIAdapter3;

    #overlay (idxgiadapter3) vtable: *IDXGIAdapter4_VTable; // Overlay parent's vtable with IDXGIAdapter4’s vtable
}
IDXGIAdapter4_VTable :: struct #type_info_none {
    using,except(vtable) vtable:   IDXGIAdapter3_VTable;
    GetDesc3: #type (this: *IDXGIAdapter4, pDesc: *DXGI_ADAPTER_DESC3) -> HRESULT #cpp_method;
}
IDXGIAdapter4_GetDesc3 :: inline (this: *IDXGIAdapter4, pDesc: *DXGI_ADAPTER_DESC3) -> HRESULT { return this.vtable.GetDesc3(this, pDesc); }

vtable :: (obj: *IDXGIAdapter4) -> *IDXGIAdapter4_VTable { return obj.vtable; }


DXGI_OUTPUT_DESC1 :: struct {
    DeviceName:            [32] s16;
    DesktopCoordinates:    RECT;
    AttachedToDesktop:     BOOL;
    Rotation:              DXGI_MODE_ROTATION;
    Monitor:               HMONITOR;
    BitsPerColor:          u32;
    ColorSpace:            DXGI_COLOR_SPACE_TYPE;
    RedPrimary:            [2] float;
    GreenPrimary:          [2] float;
    BluePrimary:           [2] float;
    WhitePoint:            [2] float;
    MinLuminance:          float;
    MaxLuminance:          float;
    MaxFullFrameLuminance: float;
}

DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS :: enum_flags u32 {
    FULLSCREEN       :: 0x1;
    WINDOWED         :: 0x2;
    CURSOR_STRETCHED :: 0x4;

    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_FULLSCREEN       :: FULLSCREEN;
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_WINDOWED         :: WINDOWED;
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_CURSOR_STRETCHED :: CURSOR_STRETCHED;
}


IDXGIOutput6_UUID :: "068346e8-aaec-4b84-add7-137f513f77a1";
IDXGIOutput6 :: struct {
    #as using,except(vtable) idxgioutput5: IDXGIOutput5;

    #overlay (idxgioutput5) vtable: *IDXGIOutput6_VTable; // Overlay parent's vtable with IDXGIOutput6’s vtable
}
IDXGIOutput6_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                          IDXGIOutput5_VTable;
    GetDesc1:                        #type (this: *IDXGIOutput6, pDesc: *DXGI_OUTPUT_DESC1) -> HRESULT #cpp_method;
    CheckHardwareCompositionSupport: #type (this: *IDXGIOutput6, pFlags: *u32) -> HRESULT #cpp_method;
}
IDXGIOutput6_GetDesc1 :: inline (this: *IDXGIOutput6, pDesc: *DXGI_OUTPUT_DESC1) -> HRESULT { return this.vtable.GetDesc1(this, pDesc); }

IDXGIOutput6_CheckHardwareCompositionSupport :: inline (this: *IDXGIOutput6, pFlags: *u32) -> HRESULT { return this.vtable.CheckHardwareCompositionSupport(this, pFlags); }

vtable :: (obj: *IDXGIOutput6) -> *IDXGIOutput6_VTable { return obj.vtable; }


DXGI_GPU_PREFERENCE :: enum s32 {
    UNSPECIFIED      :: 0;
    MINIMUM_POWER    :: 1;
    HIGH_PERFORMANCE :: 2;

    DXGI_GPU_PREFERENCE_UNSPECIFIED      :: UNSPECIFIED;
    DXGI_GPU_PREFERENCE_MINIMUM_POWER    :: MINIMUM_POWER;
    DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE :: HIGH_PERFORMANCE;
}


IDXGIFactory6_UUID :: "c1b6694f-ff09-44a9-b03c-77900a0a1d17";
IDXGIFactory6 :: struct {
    #as using,except(vtable) idxgifactory5: IDXGIFactory5;

    #overlay (idxgifactory5) vtable: *IDXGIFactory6_VTable; // Overlay parent's vtable with IDXGIFactory6’s vtable
}
IDXGIFactory6_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                     IDXGIFactory5_VTable;
    EnumAdapterByGpuPreference: #type (this: *IDXGIFactory6, Adapter: u32, GpuPreference: DXGI_GPU_PREFERENCE, riid: *IID, ppvAdapter: **void) -> HRESULT #cpp_method;
}
IDXGIFactory6_EnumAdapterByGpuPreference :: inline (this: *IDXGIFactory6, Adapter: u32, GpuPreference: DXGI_GPU_PREFERENCE, riid: *IID, ppvAdapter: **void) -> HRESULT { return this.vtable.EnumAdapterByGpuPreference(this, Adapter, GpuPreference, riid, ppvAdapter); }

vtable :: (obj: *IDXGIFactory6) -> *IDXGIFactory6_VTable { return obj.vtable; }



IDXGIFactory7_UUID :: "a4966eed-76db-44da-84c1-ee9a7afb20a8";
IDXGIFactory7 :: struct {
    #as using,except(vtable) idxgifactory6: IDXGIFactory6;

    #overlay (idxgifactory6) vtable: *IDXGIFactory7_VTable; // Overlay parent's vtable with IDXGIFactory7’s vtable
}
IDXGIFactory7_VTable :: struct #type_info_none {
    using,except(vtable) vtable:                         IDXGIFactory6_VTable;
    RegisterAdaptersChangedEvent:   #type (this: *IDXGIFactory7, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT #cpp_method;
    UnregisterAdaptersChangedEvent: #type (this: *IDXGIFactory7, dwCookie: u32) -> HRESULT #cpp_method;
}
IDXGIFactory7_RegisterAdaptersChangedEvent :: inline (this: *IDXGIFactory7, hEvent: HANDLE, pdwCookie: *u32) -> HRESULT { return this.vtable.RegisterAdaptersChangedEvent(this, hEvent, pdwCookie); }

IDXGIFactory7_UnregisterAdaptersChangedEvent :: inline (this: *IDXGIFactory7, dwCookie: u32) -> HRESULT { return this.vtable.UnregisterAdaptersChangedEvent(this, dwCookie); }

vtable :: (obj: *IDXGIFactory7) -> *IDXGIFactory7_VTable { return obj.vtable; }


DXGIDisableVBlankVirtualization :: () -> HRESULT #foreign dxgi;

#scope_file

dxgi :: #library,system "dxgi";
dxgidebug :: #library,system "dxgidebug";
