# Development Machine Snippets

Scripts for setting up a development machine or container.

## Overview

| Type         | Focus                                                                     | Directory   |
| ------------ | ------------------------------------------------------------------------- | ----------- |
| Machine/Host | Install Docker, package managers, and an editor.                          | `host`      |
| Container    | `sudo` without a password, shell history, use [devcontainer][2]s.         | `container` |
| Both         | Based off of [Buildpack Deps][1] and have a nice shell environment setup. | `share`     |

The `util` directory contains scripts that are used by the other scripts, and some that are just intended for use by the user.

## Assumptions

### Platform

Hosts and containers are Debian based. It is assumed they also work on Ubuntu and WSL (Windows Subsystem for Linux).
Many will also work on MacOS, but `install-*` scripts in particular may result in unexpected behavior.

### Other

These are not required but are assumed to be present.

- git
- vscode

## Package Managers

Hosts tend to use an abundance mentality, while containers are more minimalist.

0. APT (`apt-get`) is assumed to be built in for many of the `install-*` scripts.
1. Homebrew
2. npm (via nvm) and Yarn
3. pip (via venv at ~/.venv, python3-venv from apt)
4. Go Modules (via go)
5. gem Rubygems (via apt)
6. pub dart (via flutter sdk, includes dart sdk)
7. conda
8. cargo Rust (via rustup)
9. gradle (via brew)
10. composer PHP (via apt)

<!-- ## Conventions

- `/local` holds all the private settings and files that are not checked into source control.
  - `/local.default` holds the default settings and files that are checked into source control.
  - .bash_history is linked to

### Project Structure -->

[1]: https://github.com/docker-library/buildpack-deps/tree/master/debian/bookworm
[2]: https://container.dev
