#!/bin/bash
set -e
# if [ $# -ne 1 ]; then
# 	echo "usage: $0 <git repo url>"
# 	exit 1
# fi
# repo="$1"
repo="https://github.com/jifalops/dotfiles.git"
if [ -d ~/dotfiles ]; then
  echo "~/dotfiles already exists"
  exit 1
fi
git clone "$repo" ~/dotfiles
pushd ~/dotfiles > /dev/null
bash ./install.sh
popd > /dev/null
