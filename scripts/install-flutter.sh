# https://docs.flutter.dev/get-started/install/linux#linux-setup
sudo apt-get install -y --no-install-recommends clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
if [ -d "$HOME/flutter" ]; then
  echo "Flutter is already installed"
  exit 1
fi
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -d "\$HOME/flutter/bin" ]; then
  export PATH="\$HOME/flutter/bin:\$PATH"
fi
if [ -d "\$HOME/.pub-cache/bin" ]; then
  export PATH="\$HOME/.pub-cache/bin:\$PATH"
fi
EOF
