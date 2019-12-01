// wenable directors in top level module!

%include "../../swig/longbuffer.i"
%include "../../swig/void_to_byte_buffer.i"

%apply void* VOIDBUFFER { void * };
%apply unsigned int* LONGBUFFER { unsigned int* };

%feature("director") libyuv::MJpegDecoder::Callback;
%ignore handler_helper;
%ignore handler_ptr;
%ignore DecodeToCallback(CallbackFunction fn, void* opaque, int dst_width, int dst_height);
%extend libyuv::MJpegDecoder {
    struct MJpegDecoderCallback {
        virtual void handle(void* opaque,
                            const uint8* const* data,
                            const int* strides,
                            int rows) = 0;
        virtual ~MJpegDecoderCallback() {}
    };

    static MJpegDecoderCallback *handler_ptr = NULL;

    static int handler_helper(void* opaque,
            const uint8* const* data,
            const int* strides,
            int rows) {
        return handler_ptr->handle(opaque, data, strides, rows);
    }

    bool DecodeToCallback(MJpegDecoderCallback *handler,
            void* opaque,
            int dst_width,
            int dst_height) {
        handler_ptr = handler;
        int result = this->DecodeToCallback(&handler_helper, opaque, dst_width, dst_height);
        handler = NULL;
        return result;
    }
};



%{
#include "libyuv/mjpeg_decoder.h"
%}
%include "libyuv/mjpeg_decoder.h"