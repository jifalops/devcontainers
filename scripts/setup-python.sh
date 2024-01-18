#!/bin/bash
set -e
if [ ! -d "$HOME/.venv" ]; then
    sudo apt-get install -y python3-venv
    python3 -m venv "$HOME/.venv"
    PATH="$HOME/.venv/bin:$PATH"
    echo 'PATH="$HOME/.venv/bin:$PATH"' >> "$HOME/.bashrc"
fi
