adb(){
    /mnt/e/source/Android/Sdk/platform-tools/adb.exe "$@"
}

export TARGET_COMPILE=/home/tcz/environment/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
export ANDROID=12
cd ../source || exit
make

kpatch_file="/data/local/tmp/kpatch"
kpatch_key="tcz021112"
kpm_name="Test"
kpm_file="/data/local/tmp/ap.kpm"

adb devices

# 卸载模块的名称
adb shell su -c "$kpatch_file $kpatch_key kpm unload $kpm_name"

adb push ../source/ap.kpm $kpm_file

# 加载模块的路径
adb shell su -c "$kpatch_file $kpatch_key kpm load $kpm_file"

rm -f ../source/ap.kpm