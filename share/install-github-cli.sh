#!/bin/bash
set -e
if command -v brew > /dev/null; then
  brew install gh
else
  script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
  $script_dir/../util/install-from-github cli/cli
fi
