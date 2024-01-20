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

- git as the SCM
- VS Code as the editor

<!-- ## Conventions

- `/local` holds all the private settings and files that are not checked into source control.
  - `/local.default` holds the default settings and files that are checked into source control.
  - .bash_history is linked to

### Project Structure -->

[1]: https://github.com/docker-library/buildpack-deps/tree/master/debian/bookworm
[2]: https://container.dev
