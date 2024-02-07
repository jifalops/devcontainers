#!/bin/bash
set -e
sudo apt install -y --no-install-recommends qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager qemu-utils dnsmasq virt-viewer
# Fix installation issues on chromeos
printf 'user = "root"\ngroup = "root"\nremember_owner = 0\ncgroup_device_acl=[]\n' | sudo tee -a /etc/libvirt/qemu.conf

# Add groups
sudo usermod -aG libvirt "$USER"
sudo usermod -aG libvirt-qemu "$USER"
sudo usermod -aG kvm "$USER"
# Simulate a login
sudo su "$USER"
