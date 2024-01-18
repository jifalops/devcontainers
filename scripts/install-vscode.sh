#!/bin/bash

if [ "$(uname -s)" = "Darwin" ]; then
    dmg_file=vscode.dmg
    wget -O "$dmg_file" "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"

    # Mount the disk image
    hdiutil attach "$dmg_file"

    cp -R "/Volumes/$(basename "$dmg_file" .dmg)/VS Code.app" /Applications/

    # Unmount the disk image
    hdiutil detach "/Volumes/$(basename "$dmg_file" .dmg)"

    rm $dmg_file
else
    wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
    sudo apt install -y --no-install-recommends ./vscode.deb
    rm ./vscode.deb
fi
