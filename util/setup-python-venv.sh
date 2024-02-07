#!/bin/bash
set -e
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi
dir="$1"
if [ -e "$dir" ]; then
    echo "$dir already exists"
    exit 1
fi

echo "Setting up a Python virtual environment at $dir"
sudo apt-get install -y --no-install-recommends python3-venv &> /dev/null
python3 -m venv "$dir"
