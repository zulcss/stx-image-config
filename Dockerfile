FROM debian:bullseye

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y  --no-install-recommends ca-certificates debsums dosfstools \
    fai-server fai-setup-storage fdisk make python3 python3-libcloud qemu-utils udev git
