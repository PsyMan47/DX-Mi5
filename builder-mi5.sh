KERNEL_DIR=$PWD
ANYKERNEL_DIR=../AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-gemini-"
VER="-v0.4-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/gemini/zImage $ANYKERNEL_DIR/gemini/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=/home/psybuntu/toolchain/aarch64-linux-android-5.3/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=/home/psybuntu/toolchain/aarch64-linux-android-5.3/lib/
export USE_CCACHE=1
export CCACHE_DIR=/home/psybuntu/DragonXia-OC-LOS/CCACHES/gemini/.ccache

make clean && make mrproper
make gemini_defconfig
make -j3

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/gemini/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/gemini/zImage
cd $ANYKERNEL_DIR/gemini
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
