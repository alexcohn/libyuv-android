// float buffer
%typemap(jni) signed char * CHAR_TO_SHORT_BUFFER "jobject"
%typemap(jtype) signed char * CHAR_TO_SHORT_BUFFER "java.nio.ShortBuffer"
%typemap(jstype) signed char * CHAR_TO_SHORT_BUFFER "java.nio.ShortBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") signed char * CHAR_TO_SHORT_BUFFER "$javainput"
%typemap(javaout) signed char * CHAR_TO_SHORT_BUFFER {
        return $jnicall;
}
%typemap(in) signed char * CHAR_TO_SHORT_BUFFER {
        $1 = (signed char * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.ShortBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) signed char * CHAR_TO_SHORT_BUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) signed char * CHAR_TO_SHORT_BUFFER ""