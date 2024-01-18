#!/bin/bash
if [ ! -d "$HOME/.local/venv" ]; then
    python3 -m venv "$HOME/.local/venv"
    echo 'PATH="$HOME/.local/venv/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.local/venv/bin/activate"
fi
