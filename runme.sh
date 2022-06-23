#!/bin/bash

rm -f generic-vm-image-bullseye-image.qcow2
qemu-img convert -f raw -O qcow2 generic-vm-image-bullseye-image.raw \
    generic-vm-image-bullseye-image.qcow2
virt-install \
    --name debian-starlingx \
    --memory 2048 \
    --cpus 2 \
    --disk ./generic-vm-image-bullseye-image.qcow2 \
    --import \
    --graphics vnc \
    --os-variant debian11
