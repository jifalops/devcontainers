#!/usr/bin/env bash
if [ $# -ne 2 ]; then
	echo "usage: $0 <from> <to>"
	exit 1
fi
if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run as root"
	exit 1
fi
from=$1
to=$2
killall --user $from 2> /dev/null
groupmod --new-name $to $from
usermod --move-home --home /home/$to --login $to $from
usermod --append --groups users $to
echo $to ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$to
chmod 0440 /etc/sudoers.d/$to
rm /etc/sudoers.d/$from 2> /dev/null
