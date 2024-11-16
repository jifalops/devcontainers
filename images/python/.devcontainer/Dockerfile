# https://github.com/devcontainers/images/tree/main/src/python/.devcontainer
ARG VARIANT=3-bookworm
FROM mcr.microsoft.com/devcontainers/python:${VARIANT}

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
  bash-completion python3-venv pipx nano

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

# Set up a python environment for the user.
# This gives the user their own "global but isolated" environment for pip and supports ad-hoc python usage.
RUN python3 -m venv ~/.venv &&\
  echo 'PATH="$HOME/.venv/bin:$PATH"' >> ~/.bashrc

# Use pipx to install command line utilities.
RUN pipx install poetry &&\
  pipx install uvicorn &&\
  pipx install isort &&\
  echo 'PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc &&\
  bash -ic 'poetry config virtualenvs.in-project true'
