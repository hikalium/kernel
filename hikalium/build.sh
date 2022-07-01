export BUILD_DIR=`readlink -f .`/build/HEAD
echo ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
make -C .. O=${BUILD_DIR} x86_64_defconfig
make -C .. O=${BUILD_DIR} -j `nproc` vmlinux
