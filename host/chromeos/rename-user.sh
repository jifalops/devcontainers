#!/bin/bash
# Adapted from https://www.reddit.com/r/Crostini/wiki/howto/change-default-username/.
# Note that run_container.sh no longer exists, so creating a container with the desired username is not currently possible.
if [ $# -ne 2 ]; then
	echo "usage: rename_user.sh <from> <to>"
	exit 1
fi
from=$1
to=$2
killall --user $from
groupmod --new-name $to $from
usermod --move-home --home /home/$to --login $to $from
usermod --append --groups users $to
