#!/bin/bash

HOSTNAME=$1
CLIENTIP=$2
VCPUS=${3:-2}
MEMORY=${4:-2048}
DISKSIZE=${5:-30}
# DISKPATH=./STORAGE/$HOSTNAME.rawdisk
DISKPATH=./$HOSTNAME.rawdisk
MACADDR=RANDOM
DEVICE=enp1s0
AUTOCONF=off
BRIDGE=virbr0
SERVERIP=
DNS0IP=192.168.122.1
DNS1IP=
GATEWAYIP=192.168.122.1
NETMASK=255.255.255.0
# LOCATION=./ubuntu-autoinstall-generator/ubuntu-autoinstall.iso
LOCATION=./ubuntu-autoinstall.iso

sudo virt-install \
--connect=qemu:///system \
--name $HOSTNAME \
--memory $MEMORY \
--vcpus $VCPUS \
--bridge=$BRIDGE \
--mac=$MACADDR \
--autostart \
--check-cpu \
--os-type=linux \
--force \
--graphics none \
--virt-type kvm \
--os-variant=ubuntu22.04 \
--location $LOCATION,initrd=casper/initrd,kernel=casper/vmlinuz \
--disk path=$DISKPATH,format=raw,cache=none,bus=virtio,size=$DISKSIZE \
--debug \
--noautoconsole \
--wait=-1 \
--extra-args="ip=$CLIENTIP:$SERVERIP:$GATEWAYIP:$NETMASK:$HOSTNAME:$DEVICE:$AUTOCONF:$DNS0IP:$DNS1IP console=ttyS0 quiet autoinstall ds=nocloud;s=/cdrom/nocloud/"

