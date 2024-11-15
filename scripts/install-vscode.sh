#!/usr/bin/env bash
wget vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
export DEBIAN_FRONTEND=noninteractive
sudo apt install -y --no-install-recommends ./vscode.deb
rm ./vscode.deb
