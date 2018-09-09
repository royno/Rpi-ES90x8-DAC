#!/bin/bash
cp es9038q2m-dac-overlay.dtbo ~/moode/boot/overlays/
cp es9038q2m-dac.ko ~/moode/lib/modules/4.14.62+/kernel/sound/soc/bcm/
cp es9038q2m.ko ~/moode/lib/modules/4.14.62+/kernel/sound/soc/codecs/

