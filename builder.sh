KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-scorpio-"
VER="-v1.0"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER".zip

if [ -f "$FINAL_ZIP" ]; then
   rm -f $FINAL_ZIP
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC/.ccache

make clean && make mrproper
make scorpio_defconfig
make -j9

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/zImage
cp $KERNEL_DIR/drivers/staging/qcacld-2.0/wlan.ko $ANYKERNEL_DIR/

cd $ANYKERNEL_DIR
zip -r9 $FINAL_ZIP * -x README.md $FINAL_ZIP
