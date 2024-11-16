# https://github.com/devcontainers/images/blob/main/src/typescript-node/.devcontainer/Dockerfile
ARG VARIANT=22-bookworm
FROM mcr.microsoft.com/devcontainers/typescript-node:1-${VARIANT}

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
  bash-completion python3-venv pipx nano

# Rename the 'node' user.
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ARG USERNAME=developer
RUN groupmod --new-name $USERNAME node &&\
  usermod --move-home --home /home/$USERNAME --login $USERNAME node &&\
  usermod --append --groups users $USERNAME &&\
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME &&\
  chmod 0440 /etc/sudoers.d/$USERNAME &&\
  rm /etc/sudoers.d/node

# Become the normal user and cd.
USER $USERNAME
WORKDIR /home/$USERNAME

# Set up a python environment for the user.
# This gives the user their own "global but isolated" environment for pip and supports ad-hoc python usage.
RUN python3 -m venv ~/.venv &&\
  echo 'PATH="$HOME/.venv/bin:$PATH"' >> ~/.bashrc

# Setup Python poetry
RUN pipx install poetry &&\
  echo 'PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc &&\
  ~/.local/bin/poetry config virtualenvs.in-project true
