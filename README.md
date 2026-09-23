# OpenCode Docker

Isolated Docker environment for [OpenCode](https://github.com/anomalyco/opencode) with pre-installed development tools and language servers. No local OpenCode installation required on the host.

## Quick Start

### 1. Configure Authentication

Create the configuration directory and add your API key to `~/.config/opencode-docker/auth.json`:

```bash
mkdir -p ~/.config/opencode-docker
```

`~/.config/opencode-docker/auth.json`:

```json
{
  "opencode": {
    "type": "api",
    "key": "sk-key"
  }
}
```

State, history, logs, and database files will also persist in `~/.config/opencode-docker`.

### 2. Add Shell Function

Add to `~/.bashrc` or `~/.zshrc`:

```bash
opencode() {
    docker run --rm -it \
        --pull=always \
        --user "$(id -u):$(id -g)" \
        -e HOME=/tmp \
        -e XDG_DATA_HOME=/opencode-data \
        -v "$PWD:/workspace" \
        -v "$HOME/.config/opencode-docker:/opencode-data/opencode" \
        -w /workspace \
        ghcr.io/mitjafelicijan/opencode-docker:latest
}
```

> [!IMPORTANT]
> The `--user "$(id -u):$(id -g)"` flag ensures that files created inside `/workspace` belong to your host user and group, not `root`.

Reload shell:

```bash
source ~/.bashrc
```

### 3. Run

From any project directory:

```bash
cd ~/path/to/project
opencode
```

> [!NOTE]
> Only the directory from which `opencode` is executed (`$PWD`) is mounted to `/workspace` inside the container. The rest of your host filesystem remains inaccessible.

## Included Tools & Language Servers

- **C / C++**: Clang, clangd, Make
- **Lua**: Lua 5.4, lua-language-server (`lua-ls`)
- **Go**: Go, gopls
- **Rust**: Rust, Cargo, rust-analyzer
- **Zig**: Zig, zls
- **Python**: Python 3, pip, Pyright
- **PHP**: PHP, Intelephense
- **TypeScript / JavaScript**: Node.js, npm, typescript-language-server
- **Shell**: Bash, Bash Language Server
- **DevOps & Formats**: Dockerfile Language Server, YAML Language Server, VS Code HTML/CSS/JSON
- **CLI Utilities**: Git, curl, jq, grep, find, unzip, zip

## Build Locally (Optional)

```bash
docker build -t opencode-custom .
```
