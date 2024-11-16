curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add to .bashrc
cat << EOF >> "$HOME/.bashrc"
if [ -d "\$HOME/.cargo/bin" ]; then
  export PATH="\$HOME/.cargo/bin:\$PATH"
fi
if [ -f "\$HOME/.cargo/env" ]; then
    . "\$HOME/.cargo/env"
fi
EOF
