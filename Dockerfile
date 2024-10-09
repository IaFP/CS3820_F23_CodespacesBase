FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# install dependencies
RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        curl \
        libnuma-dev \
        zlib1g-dev \
        libgmp-dev \
        libgmp10 \
        git \
        wget \
        lsb-release \
        software-properties-common \
        gnupg2 \
        apt-transport-https \
        gcc \
        autoconf \
        automake \
        build-essential


# install gpg keys
ARG GPG_KEY=7D1E8AFD1D4A16D71FADA2F2CCC85C0E40C06A8C
RUN gpg --batch --keyserver keys.openpgp.org --recv-keys $GPG_KEY

# install ghcup
RUN \
    curl https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup > /usr/bin/ghcup && \
    chmod +x /usr/bin/ghcup && \
    ghcup upgrade && \
    ghcup config set gpg-setting GPGLax

ARG GHC=9.6.2
ARG CABAL=3.10.1.0
ARG HLS=2.1.0.0

# install GHC and cabal

USER vscode

ENV PATH=${PATH}:/home/vscode/.ghcup/bin

RUN \
    ghcup -v install ghc ${GHC} && \
    ghcup -v install cabal ${CABAL} && \
    ghcup -v install hls ${HLS} && \
    ghcup -v set ghc ${GHC} && \
    ghcup -v set cabal ${CABAL} && \
    ghcup -v set hls ${HLS}

RUN \
    cabal update && \  
    cabal install --lib QuickCheck HUnit


RUN echo 'PATH=$PATH:/home/vscode/.ghcup/bin' >> /home/vscode/.bashrc