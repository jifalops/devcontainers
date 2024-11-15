#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pushd "$SCRIPT_DIR" > /dev/null

# Base
./install-buildpack-deps.sh

# Languages and Package Managers
./setup-python-venv-for-user.sh
./install-python3-poetry.sh
./install-nvm-node-npm-yarn-pnpm.sh
./install-go.sh
./install-cargo-rust.sh
./install-java-maven-gradle.sh

# Tools
./install-zsh-fish.sh
./install-nano.sh
./install-git-transcrypt.sh
./install-trash-cli.sh
./install-github-cli.sh
./install-docker.sh
./install-vscode.sh

# Omitted
#./install-flutter.sh
#./install-gcloud-sdk.sh
#./install-git-kraken.sh
#./install-homebrew.sh
#./install-miniconda.sh
#./install-rubygems.sh

popd > /dev/null