// float buffer
%typemap(jni) float * FLOATBUFFER "jobject"
%typemap(jtype) float * FLOATBUFFER "java.nio.FloatBuffer"
%typemap(jstype) float * FLOATBUFFER "java.nio.FloatBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") float * FLOATBUFFER "$javainput"
%typemap(javaout) float * FLOATBUFFER {
        return $jnicall;
}
%typemap(in) float * FLOATBUFFER {
        $1 = (float * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.FloatBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) float * FLOATBUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) float * FLOATBUFFER ""