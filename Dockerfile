FROM ghcr.io/anomalyco/opencode:latest

USER root

# System tools, PHP, and C/C++ tooling
RUN apk add --no-cache \
    clang \
    clang-extra-tools \
    git \
    curl \
    unzip \
    php \
    nodejs \
    npm

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
