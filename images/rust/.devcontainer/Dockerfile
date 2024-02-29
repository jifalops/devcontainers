# The base image
# https://github.com/devcontainers/images/blob/main/src/rust/.devcontainer/Dockerfile
ARG VARIANT="bookworm"
FROM mcr.microsoft.com/devcontainers/rust:${VARIANT}

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
  bash-completion protobuf-compiler python3-venv

# Rename the 'vscode' user.
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ARG USERNAME=developer
RUN groupmod --new-name $USERNAME vscode &&\
  usermod --move-home --home /home/$USERNAME --login $USERNAME vscode &&\
  usermod --append --groups users $USERNAME &&\
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME &&\
  chmod 0440 /etc/sudoers.d/$USERNAME &&\
  rm /etc/sudoers.d/vscode

# Become the normal user and cd.
USER $USERNAME
WORKDIR /home/$USERNAME

# Install additional Rust tools and completions
RUN rustup component add llvm-tools-preview &&\
  cargo install cargo-msrv cargo-sort cargo-llvm-cov cargo-nextest &&\
  mkdir -p ~/.local/share/bash-completion/completions &&\
  rustup completions bash > ~/.local/share/bash-completion/completions/rustup &&\
  rustup completions bash cargo > ~/.local/share/bash-completion/completions/cargo

# Install git completion for bash.
RUN curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "$HOME/.git-completion.bash" &&\
  echo 'source "$HOME/.git-completion.bash"' >> ~/.bashrc

# Setup a python virtual environment in the home directory to avoid breaking system packages with pip.
RUN python3 -m venv ~/.venv &&\
  echo 'PATH="$HOME/.venv/bin:$PATH"' >> ~/.bashrc
