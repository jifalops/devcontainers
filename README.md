# Development Containers (devcontainers)

Images and scripts<!--, and [features][3] --> for setting up development environments on a host or in a container.

Inspired by [containers.dev][1] and [github.com/devcontainers/images][2].

## Images

Docker images for particular languages or technology combinations.

- Based on [devcontainers/images][2] with additional tools and [features][3] like bash completion.
- Have a user named `developer` that can sudo without a password.
- Published to Docker Hub for easy use.
- Include a working python and node environment (pip/x, npm, etc.) for easily adding command line tools.
- Include the Github CLI for easy access to repositories.

## Scripts

Scripts can be run on a host or in a container to setup a development environment one piece at a time.

They are headless and install the latest version of tools (or latest LTS version).

### Script Compatibility

While some are cross platform, most scripts use `apt-get` and are intended for Debian based Linux distributions.

<!-- ## Features

## Template Repositories

Template repositories are a starting point for new projects that use the images in this repo. -->

[1]: https://containers.dev
[2]: https://github.com/devcontainers/images/tree/main/src
[3]: https://containers.dev/features
