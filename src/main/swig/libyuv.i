%module LibYuv

%include "stdint.i"
%include "typemaps.i"
%include "enums.swg"
%javaconst(1);
%include "various.i"
%include "../../swig/floatbuffer.i"
%include "../../swig/intbuffer.i"
%include "../../swig/ushort_to_int_buffer.i"
%include "../../swig/char_to_short_buffer.i"

%ignore GetARGBBlend;
%ignore ARGBAffineRow_SSE2;
%ignore ARGBToG;
%ignore SetUseReferenceImpl;

%apply unsigned char* NIOBUFFER { unsigned char * };
%apply float* FLOATBUFFER { float* };
%apply int* INTBUFFER { int* };
%apply unsigned short* USHORT_TO_INT_BUFFER { unsigned short* };
%apply signed char* CHAR_TO_SHORT_BUFFER { signed char* };

%{
#include "libyuv/basic_types.h"
#include "libyuv/rotate.h"
#include "libyuv/compare.h"
#include "libyuv/convert.h"
#include "libyuv/convert_argb.h"
#include "libyuv/convert_from.h"
#include "libyuv/convert_from_argb.h"
#ifdef HAS_CPUID
#include "libyuv/cpu_id.h"
#endif
#include "libyuv/planar_functions.h"
#include "libyuv/rotate_argb.h"
#include "libyuv/scale.h"
#include "libyuv/scale_argb.h"
#ifdef HAS_ROW
#include "libyuv/scale_row.h"
#include "libyuv/row.h"
#endif
#include "libyuv/version.h"
#ifdef HAS_VIDEO
#include "libyuv/video_common.h"
#endif
%}

%include "libyuv/basic_types.h"
%include "libyuv/rotate.h"
%include "libyuv/compare.h"
%include "libyuv/convert.h"
%include "libyuv/convert_argb.h"
%include "libyuv/convert_from.h"
%include "libyuv/convert_from_argb.h"
#ifdef HAS_CPUID
%include "libyuv/cpu_id.h"
#endif
%include "libyuv/planar_functions.h"
%include "libyuv/rotate_argb.h"
%include "libyuv/scale.h"
%include "libyuv/scale_argb.h"
#ifdef HAS_ROW
%include "libyuv/scale_row.h"
%include "libyuv/row.h"
#endif
%include "libyuv/version.h"
#ifdef HAS_VIDEO
%include "libyuv/video_common.h"
#endif

#ifdef HAS_MJPEG
%include "../../swig/mjpegdecoder.i"
#endif