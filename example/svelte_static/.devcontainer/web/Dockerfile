FROM mcr.microsoft.com/vscode/devcontainers/typescript-node

# Install OS packages
# RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt install -y --no-install-recommends \
#   ...

RUN passwd --delete node

# Svelte
EXPOSE 5173

USER node
WORKDIR /workspace/web
ENTRYPOINT [ "./run.sh" ]
