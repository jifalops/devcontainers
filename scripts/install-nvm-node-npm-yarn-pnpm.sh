#!/usr/bin/env bash
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# If NVM_DIR is set but doesn't exist, create it to avoid an error.
if [ -n "$NVM_DIR" ]; then
  if [ ! -e "$NVM_DIR" ]; then
    mkdir -p "$NVM_DIR"
  fi
fi

# Install npm via nvm.
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
. ~/.bashrc
. $NVM_DIR/nvm.sh
nvm install node
npm install -g npm yarn pnpm
