#!/bin/bash

if [ -z "$GIT_EMAIL" ]; then
    echo "GIT_EMAIL not set"
    exit 1
fi
if [ -z "$GIT_NAME" ]; then
    echo "GIT_NAME not set"
    exit 1
fi

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
git config --global init.defaultBranch main
git config --global fetch.prune true
git config --global pull.rebase true
git config --global push.default simple
git config --global core.editor code --wait
