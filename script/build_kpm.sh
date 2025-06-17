adb(){
    /mnt/e/source/Android/Sdk/platform-tools/adb.exe "$@"
}

export TARGET_COMPILE=/home/tcz/environment/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
export ANDROID=12
cd ../source || exit
make

# adb devices
# adb push ../source/ap.kpm /data/local/tmp
# adb shell "su -c 'kpatch tcz021112 kpm load /data/local/tmp/ap.kpm'"