#!/bin/bash
if [ ! -d "$HOME/.venv" ]; then
    python3 -m venv "$HOME/.venv"
    PATH="$HOME/.venv/bin:$PATH"
    echo 'PATH="$HOME/.venv/bin:$PATH"' >> "$HOME/.bashrc"
fi
