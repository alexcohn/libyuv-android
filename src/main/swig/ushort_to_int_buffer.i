// float buffer
%typemap(jni) unsigned short * USHORT_TO_INT_BUFFER "jobject"
%typemap(jtype) unsigned short * USHORT_TO_INT_BUFFER "java.nio.IntBuffer"
%typemap(jstype) unsigned short * USHORT_TO_INT_BUFFER "java.nio.IntBuffer"
%typemap(javain,
        pre="  assert $javainput.isDirect() : \"Buffer must be allocated direct.\";") unsigned short * USHORT_TO_INT_BUFFER "$javainput"
%typemap(javaout) unsigned short * USHORT_TO_INT_BUFFER {
        return $jnicall;
}
%typemap(in) unsigned short * USHORT_TO_INT_BUFFER {
        $1 = (unsigned short * ) JCALL1(GetDirectBufferAddress, jenv, $input);
        if ($1 == NULL) {
            SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, "Unable to get address of a java.nio.IntBuffer direct byte buffer. Buffer must be a direct buffer and not a non-direct buffer.");
        }
}
%typemap(memberin) unsigned short * USHORT_TO_INT_BUFFER {
        if ($input) {
            $1 = $input;
        } else {
            $1 = 0;
        }
}
%typemap(freearg) unsigned short * USHORT_TO_INT_BUFFER ""