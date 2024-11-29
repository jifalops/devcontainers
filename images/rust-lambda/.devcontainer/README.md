# Rust with AWS Lambda

Published to [`jifalops/rust-lambda`](https://hub.docker.com/repository/docker/jifalops/rust-lambda) on Docker Hub.

## Notes

- The Docker-in-Docker feature starts the daemon when the container starts, but the lifecycle callbacks aren't triggered
when bundling a devcontainer feature into an image. So when using this image you should start the daemon manually:

    ```json
    {
      "postStartCommand": "sudo nohup dockerd &"
    }
    ```
