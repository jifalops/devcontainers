#!/bin/bash

sudo apt-get install -y --no-install-recommends build-essential
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
EOF
