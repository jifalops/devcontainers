#!/bin/bash
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

bash "$script_dir/../util/setup-python-venv" "$HOME/.venv"
export PATH="$HOME/.venv/bin:$PATH"
echo 'PATH="$HOME/.venv/bin:$PATH"' >> "$HOME/.bashrc"
