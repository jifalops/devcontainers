#!/bin/bash
set -e
if [ ! -d "$HOME/.venv" ]; then
    echo "Setting up a Python virtual environment in $HOME/.venv"
    sudo apt-get install -y --no-install-recommends python3-venv
    python3 -m venv "$HOME/.venv"
    export PATH="$HOME/.venv/bin:$PATH"
    echo 'PATH="$HOME/.venv/bin:$PATH"' >> "$HOME/.bashrc"
else
    echo "Python virtual environment already exists in $HOME/.venv"
fi
