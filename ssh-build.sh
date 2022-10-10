# (C) 2016 shmilee, GPLv3
# Requires:
# Android NDK r8e x86_64 (http://developer.android.com/ndk/downloads/index.html)

helper()
{
    echo "Usage: $0 <ANDROID_NDK_ROOT>"
    echo "  ANDROID_NDK_ROOT    default is $HOME/android/android-ndk-r8e"
    exit 1
}

NCPU=$(grep -ci processor /proc/cpuinfo)
ANDROID_NDK_ROOT=${1:-"$HOME/android/android-ndk-r8e"}
export ANDROID_NDK_ROOT

if [ ! -d $ANDROID_NDK_ROOT ]; then
    echo "ANDROID_NDK_ROOT $ANDROID_NDK_ROOT not found."
    helper
    exit 1
fi

echo ">>> build"
cd jni
$ANDROID_NDK_ROOT/ndk-build -j$NCPU || exit 1

echo ">>> copy"
cd ../
mkdir -p compiled/armeabi-v7a
cp -v libs/armeabi-v7a/{scp,sftp,sftp-server,sshd,ssh_exe,ssh-keygen,libssh.so} compiled/armeabi-v7a/
