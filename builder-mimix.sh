KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/lithium
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-lithium-"
VER="-v0.7-"
TYPE="MIUI"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm -rf $ANYKERNEL_DIR/lithium/*.ko && rm $ANYKERNEL_DIR/lithium/zImage $ANYKERNEL_DIR/lithium/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make lithium_defconfig
make -j$( nproc --all )

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
