# path to the config space shoud be absolute, see fai.conf(5)
PWD != pwd

build:
	docker build -t fai .

go:
	docker run -i -t --privileged -v /dev:/dev -v $(PWD):/work fai /bin/bash

generic-vm-image-bullseye-image.raw:
	sudo fai-diskimage -v --hostname debian-bullseye --size 60G \
	--class DEBIAN,BULLSEYE,AMD64,GRUB_PC,DHCPC,VM_IMAGE,STX \
	--cspace $(PWD)/config_space $@ || rm $@

help:
	@echo "available targets:"
	@echo "make generic-vm-image-bullseye-image.raw"

clean:
	rm -f *.raw
