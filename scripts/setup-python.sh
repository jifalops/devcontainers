#!/usr/bin/env bash

# Install pipx and the venv module.
sudo apt install -y --no-install-recommends python3-venv pipx

# Use pipx to install command line utilities.
pipx install poetry
pipx install pytest
pipx install uvicorn
pipx install black
pipx install isort

# Have poetry keep virtual environments in the project directory (with source instead of always recreated with the dev container).
poetry config virtualenvs.in-project true

# Set up a python environment for the user.
# This gives the user their own "global but isolated" environment for pip and supports ad-hoc python usage.
python3 -m venv ~/.venv

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -d "\$HOME/.venv/bin" ]; then
  export PATH="\$HOME/.venv/bin:\$PATH"
fi
EOF
