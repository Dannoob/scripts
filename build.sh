#!/bin/bash
clear

umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=Nova
export KBUILD_BUILD_HOST=Paradaisu
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"


export CROSS_COMPILE="/root/cross-tc/clang/bin/aarch64-linux-gnu-"
export CROSS_COMPILE_COMPAT="/root/cross-tc/clang/bin/arm-linux-gnueabi-"
export LD_LIBRARY_PATH="/root/cross-tc/clang/lib64:$LD_LIBRARY_PATH"


PATH="/root/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/root/cross-tc/clang/bin/clang LD=/root/cross-tc/clang/bin/aarch64-linux-gnu-ld.bfd CROSS_COMPILE_COMPAT=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/root/cross-tc/clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/root/cross-tc/clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y fenix_defconfig

PATH="/root/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/root/cross-tc/clang/bin/clang LD=/root/cross-tc/clang/bin/aarch64-linux-gnu-ld.bfd CROSS_COMPILE_COMPAT=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/root/cross-tc/clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/root/cross-tc/clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

PATH="/root/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/root/cross-tc/clang/bin/clang LD=/root/cross-tc/clang/bin/aarch64-linux-gnu-ld.bfd CROSS_COMPILE_COMPAT=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/root/cross-tc/clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/root/cross-tc/clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y prepare

PATH="/root/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/root/cross-tc/clang/bin/clang LD=/root/cross-tc/clang/bin/aarch64-linux-gnu-ld.bfd CROSS_COMPILE_COMPAT=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/root/cross-tc/clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/root/cross-tc/clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y nconfig


export KCFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KBUILD_CFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe "

#Gcc-10-Optimize
export KCFLAGS+="--param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="/root/cross-tc/clang/bin:${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=/root/cross-tc/clang/bin/clang LD=/root/cross-tc/clang/bin/aarch64-linux-gnu-ld.bfd CROSS_COMPILE_COMPAT=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/root/cross-tc/clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/root/cross-tc/clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/root/cross-tc/clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe" V=0 Image.gz-dtb dtbo.img


cp /OUT/arch/arm64/boot/Image.gz-dtb .

ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

cp /OUT/arch/arm64/boot/dtbo.img .
ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img


