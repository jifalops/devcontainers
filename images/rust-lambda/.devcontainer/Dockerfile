FROM jifalops/rust:latest

# Support arm64 and x86_64 targets.
RUN rustup target add aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu

# Install cargo-lambda and cargo-zigbuild (used by AWS SAM CLI).
RUN pipx install cargo-lambda &&\
  bash -ic 'pip install cargo-zigbuild'

# Add user to the docker group.
ARG USERNAME=developer
RUN sudo groupadd docker &&\
  sudo usermod -aG docker $USERNAME

# Enable Rust support in SAM CLI.
# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/building-rust.html
ENV SAM_CLI_BETA_RUST_CARGO_LAMBDA=1
