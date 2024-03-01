#!/bin/bash
script_dir=$(dirname "${BASH_SOURCE[0]}")
pushd $script_dir > /dev/null

devcontainer build --workspace-folder=..

popd > /dev/null
