FROM ghcr.io/anomalyco/opencode:latest

USER root

# System tools, compilers, runtimes, and utilities
RUN apk add --no-cache \
    bash \
    cargo \
    clang \
    clang-extra-tools \
    curl \
    findutils \
    git \
    go \
    gopls \
    grep \
    jq \
    lua5.4 \
    lua-language-server \
    make \
    nodejs \
    npm \
    php \
    python3 \
    py3-pip \
    rust \
    rust-analyzer \
    unzip \
    zig \
    zip \
    zls

RUN ln -sf /usr/bin/lua-language-server /usr/bin/lua-ls

# Language servers
RUN npm install -g \
    intelephense \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted \
    bash-language-server \
    yaml-language-server \
    dockerfile-language-server-nodejs \
    pyright

WORKDIR /workspace
