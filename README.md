libyuv-android
==============

This is a fork of the libyuv library, specifically built with android NDK for android targets. 

The library contains a Java wrapper generated with _swig_, to allow usage from managed code. Note, that only a subset of the available modules are wrapped using this technology. See the [swig interface definition](src/main/swig/libyuv.i) for futher info.

# Usage

`implementation 'libyuv:libyuv-android:1.0.0'`
