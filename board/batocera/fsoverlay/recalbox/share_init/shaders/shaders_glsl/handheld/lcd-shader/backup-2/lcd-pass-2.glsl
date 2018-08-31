// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _upper_bound;
COMPAT_VARYING     vec2 _lower_bound;
COMPAT_VARYING     vec2 _tex_coord_2;
COMPAT_VARYING     vec2 _tex_coord_1;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
float _placeholder31;
};
struct pass_1 {
float _placeholder35;
};
struct blur_coords {
    vec2 _tex_coord_1;
    vec2 _tex_coord_2;
    vec2 _lower_bound;
    vec2 _upper_bound;
};
vec4 _oPosition1;
blur_coords _oBlurCoords1;
input_dummy _IN1;
vec4 _r0007;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
COMPAT_VARYING vec4 TEX3;
COMPAT_VARYING vec4 TEX4;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec2 _oTexCoord;
    vec2 _texel;
    blur_coords _TMP3;
    _r0007 = VertexCoord.x*MVPMatrix[0];
    _r0007 = _r0007 + VertexCoord.y*MVPMatrix[1];
    _r0007 = _r0007 + VertexCoord.z*MVPMatrix[2];
    _r0007 = _r0007 + VertexCoord.w*MVPMatrix[3];
    _oPosition1 = _r0007;
    _oTexCoord = TexCoord.xy;
    _texel = vec2(float((1.00000000E+00/TextureSize).x), float((1.00000000E+00/TextureSize).y));
    _TMP3._tex_coord_1 = vec2(float((TexCoord.xy + vec2(0.00000000E+00, float(_texel.y))).x), float((TexCoord.xy + vec2(0.00000000E+00, float(_texel.y))).y));
    _TMP3._tex_coord_2 = vec2(float((TexCoord.xy + vec2(0.00000000E+00, float(-_texel.y))).x), float((TexCoord.xy + vec2(0.00000000E+00, float(-_texel.y))).y));
    _TMP3._upper_bound = vec2(float((vec2(float(_texel.x), float(_texel.y))*(OutputSize - 2.00000000E+00)).x), float((vec2(float(_texel.x), float(_texel.y))*(OutputSize - 2.00000000E+00)).y));
    _oBlurCoords1._tex_coord_1 = _TMP3._tex_coord_1;
    _oBlurCoords1._tex_coord_2 = _TMP3._tex_coord_2;
    _oBlurCoords1._lower_bound = vec2( 0.00000000E+00, 0.00000000E+00);
    _oBlurCoords1._upper_bound = _TMP3._upper_bound;
    gl_Position = _r0007;
    TEX0.xy = TexCoord.xy;
    TEX1.xy = _TMP3._tex_coord_1;
    TEX2.xy = _TMP3._tex_coord_2;
    TEX3.xy = vec2( 0.00000000E+00, 0.00000000E+00);
    TEX4.xy = _TMP3._upper_bound;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _upper_bound;
COMPAT_VARYING     vec2 _lower_bound;
COMPAT_VARYING     vec2 _tex_coord_2;
COMPAT_VARYING     vec2 _tex_coord_1;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
float _placeholder24;
};
struct pass_1 {
float _placeholder28;
};
struct blur_coords {
    vec2 _tex_coord_1;
    vec2 _tex_coord_2;
    vec2 _lower_bound;
    vec2 _upper_bound;
};
vec4 _ret_0;
vec4 _TMP4;
vec4 _TMP3;
vec2 _TMP5;
vec2 _TMP7;
vec2 _TMP6;
vec4 _TMP0;
pass_1 _PASS11;
vec4 _adjacent_texel_30014;
vec4 _adjacent_texel_40014;
vec3 _original_color0014;
vec4 _COLOR0014;
vec2 _TMP15;
vec2 _TMP21;
vec2 _c0032;
vec2 _c0034;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
COMPAT_VARYING vec4 TEX3;
COMPAT_VARYING vec4 TEX4;
 
uniform sampler2D Pass1Texture;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec4 _out_color;
    _TMP0 = COMPAT_TEXTURE(Pass1Texture, TEX0.xy);
    _out_color = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    if (_out_color.w > 0.00000000E+00 && _out_color.w < 1.00000000E+00) { 
        _TMP6 = min(vec2(float(TEX4.x), float(TEX4.y)), vec2(float(TEX1.x), float(TEX1.y)));
        _TMP5 = vec2(float(_TMP6.x), float(_TMP6.y));
        _TMP7 = max(vec2(float(TEX3.x), float(TEX3.y)), vec2(float(_TMP5.x), float(_TMP5.y)));
        _TMP15 = vec2(float(_TMP7.x), float(_TMP7.y));
        _TMP6 = min(vec2(float(TEX4.x), float(TEX4.y)), vec2(float(TEX2.x), float(TEX2.y)));
        _TMP5 = vec2(float(_TMP6.x), float(_TMP6.y));
        _TMP7 = max(vec2(float(TEX3.x), float(TEX3.y)), vec2(float(_TMP5.x), float(_TMP5.y)));
        _TMP21 = vec2(float(_TMP7.x), float(_TMP7.y));
        _c0032 = vec2(float(_TMP15.x), float(_TMP15.y));
        _TMP3 = COMPAT_TEXTURE(Pass1Texture, _c0032);
        _adjacent_texel_30014 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
        _c0034 = vec2(float(_TMP21.x), float(_TMP21.y));
        _TMP4 = COMPAT_TEXTURE(Pass1Texture, _c0034);
        _adjacent_texel_40014 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
        _original_color0014 = vec3(float((vec3(float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).x), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).y), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).z))/2.00000000E+00).x), float((vec3(float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).x), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).y), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).z))/2.00000000E+00).y), float((vec3(float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).x), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).y), float((_adjacent_texel_30014.xyz + _adjacent_texel_40014.xyz).z))/2.00000000E+00).z));
        _COLOR0014.xyz = _original_color0014;
        _COLOR0014.w = 1.00000000E+00;
        _out_color = _COLOR0014;
    } 
    _ret_0 = vec4(float(_out_color.x), float(_out_color.y), float(_out_color.z), float(_out_color.w));
    FragColor = _ret_0;
    return;
} 
#endif