// float buffer
%typemap(jni) void * VOIDBUFFER "jobject"
%typemap(jtype) void * VOIDBUFFER "java.nio.ByteBuffer"
%typemap(jstype) void * VOIDBUFFER "java.nio.ByteBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") void * VOIDBUFFER "$javainput"
%typemap(javaout) void * VOIDBUFFER {
        return $jnicall;
}
%typemap(in) void * VOIDBUFFER {
        $1 = (void * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.ByteBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) void * VOIDBUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) void * VOIDBUFFER ""