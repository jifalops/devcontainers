FROM mcr.microsoft.com/vscode/devcontainers/typescript-node

# Install OS packages
# RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt install -y --no-install-recommends \
#   ...

RUN passwd --delete node

USER node
WORKDIR /workspace/web
CMD [ "./run.sh" ]
