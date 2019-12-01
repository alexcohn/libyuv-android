// float buffer
%typemap(jni) unsigned int * LONGBUFFER "jobject"
%typemap(jtype) unsigned int * LONGBUFFER "java.nio.LongBuffer"
%typemap(jstype) unsigned int * LONGBUFFER "java.nio.LongBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") unsigned int * LONGBUFFER "$javainput"
%typemap(javaout) unsigned int * LONGBUFFER {
        return $jnicall;
}
%typemap(in) unsigned int * LONGBUFFER {
        $1 = (unsigned int * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.LongBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) unsigned int * LONGBUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) unsigned int * LONGBUFFER ""