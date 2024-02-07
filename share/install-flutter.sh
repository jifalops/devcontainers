sudo apt-get install -y --no-install-recommends clang cmake ninja-build pkg-config libgtk-3-dev
if [ -d "$HOME/flutter" ]; then
  echo "Flutter is already installed"
  exit 1
fi
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter


# Update current shell
export PATH="$HOME/.pub-cache/bin:$HOME/flutter/bin:$PATH"

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -d "\$HOME/flutter/bin" ]; then
  export PATH="\$HOME/flutter/bin:\$PATH"
fi
if [ -d "\$HOME/.pub-cache/bin" ]; then
  export PATH="\$HOME/.pub-cache/bin:\$PATH"
fi
EOF
