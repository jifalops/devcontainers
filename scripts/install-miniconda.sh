#!/usr/bin/env bash
url="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
wget "$url" -O miniconda.sh
bash miniconda.sh -b -p "$HOME/miniconda"
rm miniconda.sh

# Update current shell
export PATH="$HOME/miniconda/bin:$PATH"

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -d "\$HOME/miniconda/bin" ]; then
  export PATH="\$HOME/miniconda/bin:\$PATH"
fi
EOF
