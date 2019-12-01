// float buffer
%typemap(jni) int * INTBUFFER "jobject"
%typemap(jtype) int * INTBUFFER "java.nio.IntBuffer"
%typemap(jstype) int * INTBUFFER "java.nio.IntBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") int * INTBUFFER "$javainput"
%typemap(javaout) int * INTBUFFER {
        return $jnicall;
}
%typemap(in) int * INTBUFFER {
        $1 = (int * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.IntBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) int * INTBUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) int * INTBUFFER ""