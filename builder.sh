#!/bin/bash

# Psychedelic Kernel Building Script

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "P S Y C H E D E L I C   B U I L D   S C R I P T" \
    --title "MENU" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select your device:" $HEIGHT $WIDTH 4 \
    "1" "MI5s" \
    "2" "MI5s Plus" \
    "3" "MI Mix" \
    "4" "MI Note 2" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Psychedelic script terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Psychedelic script aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Psychedelic script terminated."
      ;;
    1 )
      KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-capricorn-"
VER="-v0.2"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER".zip

rm -rf $ANYKERNEL_DIR/capricorn/*.ko && rm $ANYKERNEL_DIR/capricorn/zImage $ANYKERNEL_DIR/capricorn/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC/CCACHES/capricorn/.ccache

make clean && make mrproper
make capricorn_defconfig
make -j3

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/capricorn/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/capricorn/zImage
cp $KERNEL_DIR/drivers/staging/qcacld-2.0/wlan.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/char/hw_random/msm_rng.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/char/hw_random/rng-core.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/char/rdbg.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/spi/spidev.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/input/evbug.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/crypto/ansi_cprng.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/mmc/card/mmc_test.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/video/backlight/lcd.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/video/backlight/backlight.ko $ANYKERNEL_DIR/capricorn/
cp $KERNEL_DIR/drivers/video/backlight/generic_bl.ko $ANYKERNEL_DIR/capricorn/
cd $ANYKERNEL_DIR/capricorn
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    2 )
      KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-natrium-"
VER="-v0.2"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER".zip

rm -rf $ANYKERNEL_DIR/natrium/*.ko && rm $ANYKERNEL_DIR/natrium/zImage $ANYKERNEL_DIR/natrium/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC/CCACHES/natrium/.ccache

make clean && make mrproper
make natrium_defconfig
make -j3

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/natrium/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/natrium/zImage
cp $KERNEL_DIR/drivers/staging/qcacld-2.0/wlan.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/char/hw_random/msm_rng.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/char/hw_random/rng-core.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/char/rdbg.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/spi/spidev.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/input/evbug.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/crypto/ansi_cprng.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/mmc/card/mmc_test.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/video/backlight/lcd.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/video/backlight/backlight.ko $ANYKERNEL_DIR/natrium/
cp $KERNEL_DIR/drivers/video/backlight/generic_bl.ko $ANYKERNEL_DIR/natrium/
cd $ANYKERNEL_DIR/natrium
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    3 )
KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-lithium-"
VER="-v0.2"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER".zip

rm -rf $ANYKERNEL_DIR/lithium/*.ko && rm $ANYKERNEL_DIR/lithium/zImage $ANYKERNEL_DIR/lithium/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC/CCACHES/lithium/.ccache

make clean && make mrproper
make lithium_defconfig
make -j3

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/lithium/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/lithium/zImage
cp $KERNEL_DIR/drivers/staging/qcacld-2.0/wlan.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/char/hw_random/msm_rng.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/char/hw_random/rng-core.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/char/rdbg.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/spi/spidev.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/input/evbug.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/crypto/ansi_cprng.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/mmc/card/mmc_test.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/video/backlight/lcd.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/video/backlight/backlight.ko $ANYKERNEL_DIR/lithium/
cp $KERNEL_DIR/drivers/video/backlight/generic_bl.ko $ANYKERNEL_DIR/lithium/
cd $ANYKERNEL_DIR/lithium/
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    4 )
KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-scorpio-"
VER="-v0.2"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER".zip

rm -rf $ANYKERNEL_DIR/scorpio/*.ko && rm $ANYKERNEL_DIR/scorpio/zImage $ANYKERNEL_DIR/scorpio/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC/CCACHES/scorpio/.ccache

make clean && make mrproper
make scorpio_defconfig
make -j3

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/scorpio/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/scorpio/zImage
cp $KERNEL_DIR/drivers/staging/qcacld-2.0/wlan.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/char/hw_random/msm_rng.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/char/hw_random/rng-core.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/char/rdbg.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/spi/spidev.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/input/evbug.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/crypto/ansi_cprng.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/mmc/card/mmc_test.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/video/backlight/lcd.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/video/backlight/backlight.ko $ANYKERNEL_DIR/scorpio/
cp $KERNEL_DIR/drivers/video/backlight/generic_bl.ko $ANYKERNEL_DIR/scorpio/
cd $ANYKERNEL_DIR/scorpio
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
  esac
done
