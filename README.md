# Neovim Configuration

This repository contains my personal Neovim configuration with a focus on development workflows.

## Installation

1. Clone this repository to your Neovim configuration directory:
   ```bash
   git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
   ```

2. Run the installation script:
   ```bash
   cd ~/.config/nvim
   bash ./install.sh
   ```

3. Open Neovim and install plugins:
   ```bash
   nvim
   :Lazy
   ```

4. Install all plugins using the GUI that appears

## Managing Neovim

This configuration uses Homebrew to manage Neovim installations, making it easy to update and rollback when needed.

### Updating Neovim

To update Neovim to the latest stable version:

```bash
bash ./update-neovim.sh update
```

This will:
- Unpin the current version
- Update to the latest stable version
- Pin the new version to prevent automatic updates

### Checking Current Version

To check your current Neovim version:

```bash
bash ./update-neovim.sh version
```

### Rolling Back

If you encounter issues with a new version, you can roll back:

```bash
bash ./update-neovim.sh rollback
```

This will:
- Show available versions
- Let you select a version to roll back to
- Switch to that version and pin it

## Key Features

- LSP integration with Mason for easy language server management
- Treesitter for improved syntax highlighting
- Fuzzy finding with fzf-lua
- Git integration
- Autocompletion
- Formatting and linting
- Java support via nvim-java

## Customization

The configuration is organized into modules in the `lua/user/` directory:
- `plugins.lua`: Plugin definitions
- `lsp.lua`: Language server configurations
- `user-keymaps.lua`: Key mappings
- `user-settings.lua`: General Neovim settings
