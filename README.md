Android Command Line OpenSSH
============================

Build openssh command line binaries for Android.

Upstreams:

* https://github.com/CyanogenMod/android_external_zlib.git -b cm-11.0
* https://github.com/CyanogenMod/android_external_openssl.git -b cm-11.0
* https://github.com/CyanogenMod/android_external_openssh.git -b cm-11.0

Settings
===========

* jni/external/openssh/config.h
* jni/external/openssh/pathnames.h
* jni/external/openssh/auth2-passwd.c

HOWTO build
===========

Requirements:

* Linux x86_64
* git
* [android-ndk-r8e-x86_64](https://dl.google.com/android/ndk/android-ndk-r8e-linux-x86_64.tar.bz2)

```
git clone https://github.com/cschy/android_openssh.git
cd android_openssh
./ssh-build.sh <ANDROID_NDK_ROOT> && find compiled/
```