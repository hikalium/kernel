BUILD_DIR=$(shell readlink -f ./build/HEAD)
VMLINUX=$(shell readlink -f ./build/HEAD/vmlinux)
MOUNT_DIR=$(shell readlink -f ./mnt)

vmlinux:
	echo ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}
	make -C .. O=${BUILD_DIR} chromiumos-container-vm-x86_64_defconfig
	make -C .. O=${BUILD_DIR} -j `nproc` vmlinux

files:
	rm -rf mnt
	mkdir -p mnt
	make -C ../../liumos/app/shelium
	mkdir -p mnt/sbin
	cp ../../liumos/app/shelium/shelium.bin mnt/shelium.bin

run:
	# https://www.kernel.org/doc/html/v4.14/admin-guide/kernel-parameters.html
	cd ../../crosvm && cargo run -- \
		run \
			--shared-dir "$(MOUNT_DIR):mtdfake:type=fs:cache=always" \
			--params "rootfstype=virtiofs root=mtdfake init=/shelium.bin" \
			$(VMLINUX)


