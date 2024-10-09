# CS:3820 GitHub Codespaces Base Image

This repository preserves, for some odd kind of posterity, the base image I used for assignments in the Fall '23 instance of CS:3820 at the University of Iowa.

The repository is set up for Haskell development. If you open a Codespace here, after a minute (or two) of downloading and unpacking, you should find yourself with a functional Haskell development environment.

The .devcontainer.json uses an image from DockerHub, but that image was generated from the included Dockerfile.

There are a few things that could be fixed. The biggest is that the Docker image is based on Ubuntu, which adds a lot of weight to the initial Codespace creation. I'm sure there is a more container-friendly Linux that would be better.
