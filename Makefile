KERNEL_SRC = ~/linux
BUILD_DIR := $(shell pwd)
DTC_DIR = ${KERNEL_SRC}/scripts/dtc
VERBOSE = 1

OBJS    = es9038q2m-dac.o es9038q2m.o

obj-m := $(OBJS)

all:
	make -C $(KERNEL_SRC) SUBDIRS=$(BUILD_DIR) KBUILD_VERBOSE=$(VERBOSE) modules

clean:
	make -C $(KERNEL_SRC) SUBDIRS=$(BUILD_DIR) clean
	rm -f rpi-es9018k2m-dac-overlay.dtb

dtbs:
	$(DTC_DIR)/dtc -@ -I dts -O dtb -o es9038q2m-dac-overlay.dtbo es9038q2m-dac-overlay.dts

modules_install:
	mkdir -p $(DESTDIR)/lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/
	cp rpi-es9018k2m-dac.ko $(DESTDIR)/lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/
	cp es9018k2m.ko $(DESTDIR)/lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/

modules_remove:
	rm $(DESTDIR)/lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/rpi-es9018k2m-dac.ko
	rm $(DESTDIR)/lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/es9018k2m.ko

install_dtb:
	mkdir -p $(DESTDIR)/boot/overlays/
	cp rpi-es9018k2m-dac-overlay.dtb $(DESTDIR)/boot/overlays/

remove_dtb:
	rm /boot/overlays/rpi-es9018k2m-dac-overlay.dtb

