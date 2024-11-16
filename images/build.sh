#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <target>"
  exit 1
fi
target="$1"


script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
target_path="$script_dir/$target"

if [ ! -d "$target_path" ]; then
  echo "Target not found: $target_path"
  exit 1
fi

devcontainer build --workspace-folder="$target_path"
