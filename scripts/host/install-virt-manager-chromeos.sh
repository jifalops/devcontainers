#!/bin/bash


# Use this guide to setup Windows 11 on a chromebook:
# https://www.reddit.com/r/ChromeOSFlex/comments/ucno4b/comment/i6cviv8

set -e
sudo apt install -y --no-install-recommends qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon gir1.2-spiceclientgtk-3.0 ovmf swtpm swtpm-tools qemu-utils dnsmasq virt-manager virt-viewer

# Add groups
sudo usermod -aG libvirt "$USER"
sudo usermod -aG kvm "$USER"

# Fix installation issues on chromeos
printf 'remember_owner = 0\nnamespaces=[]\n' | sudo tee -a /etc/libvirt/qemu.conf

# More installation issues
sudo mkdir /var/lib/swtpm-localca &> /dev/null
sudo chown -R tss:root /var/lib/swtpm-localca

# Simulate a login to apply the new groups
sudo su "$USER"
