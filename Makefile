KERNEL_SRC = /usr/src/linux-headers-$(shell uname -r)
BUILD_DIR := $(shell pwd)
DTC_DIR = ${KERNEL_SRC}/scripts/dtc
VERBOSE = 1

OBJS    = es9038q2m-dac.o es9038q2m.o

obj-m := $(OBJS)

all:
	make -C $(KERNEL_SRC) SUBDIRS=$(BUILD_DIR) KBUILD_VERBOSE=$(VERBOSE) modules

clean:
	make -C $(KERNEL_SRC) SUBDIRS=$(BUILD_DIR) clean
	rm -f rpi-es9038q2m-dac-overlay.dtbo

dtbs:
	$(DTC_DIR)/dtc -@ -I dts -O dtb -o es9038q2m-dac-overlay.dtbo es9038q2m-dac-overlay.dts

modules_install:
	cp es9038q2m-dac.ko /lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/
	cp es9038q2m.ko /lib/modules/$(shell uname -r)/kernel/sound/soc/codecs/

modules_remove:
	rm /lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/es9038q2m-dac.ko
	rm /lib/modules/$(shell uname -r)/kernel/sound/soc/codecs/es9018k2m.ko

install_dtbo:
	cp es9038q2m-dac-overlay.dtbo /boot/overlays/

remove_dtb:
	rm /boot/overlays/es9038k2m-dac-overlay.dtbo
