#!/bin/bash
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# If NVM_DIR is set but doesn't exist, create it to avoid an error.
if [ -n "$NVM_DIR" ]; then
  if [ ! -e "$NVM_DIR" ]; then
    mkdir -p "$NVM_DIR"
  fi
fi

version="$($script_dir/../util/get-latest-github-release-tag nvm-sh/nvm)"
echo "Installing nvm $version"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh | bash \
  && export NVM_DIR="$HOME/.nvm" \
  && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
  && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
  && nvm install node
source "$HOME/.bashrc"
npm i -g yarn pnpm
