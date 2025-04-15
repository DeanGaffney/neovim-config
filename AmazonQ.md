# FZF-Lua Quickfix List Configuration

This file contains instructions for adding Ctrl+q functionality to create a quickfix list from search results in fzf-lua.

## Implementation

Update your fzf-lua configuration in `lua/user/plugins.lua` to include keybindings for creating a quickfix list:

```lua
-- FZF-Lua
{
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        preview = {
          vertical = 'down:60%',
          layout = 'vertical',
        },
      },
      files = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          "venv",
        },
      },
      keymap = {
        builtin = {
          ["<C-a>"] = "toggle-all",
          ["<C-q>"] = "select-all+accept",
        },
        fzf = {
          ["ctrl-a"] = "toggle-all",
          ["ctrl-q"] = "select-all+accept",
        },
      },
      actions = {
        files = {
          ["default"] = actions.file_edit,
          ["ctrl-q"] = actions.file_sel_to_qf,
        },
        grep = {
          ["default"] = actions.file_edit,
          ["ctrl-q"] = actions.file_sel_to_qf,
        },
      },
    })
  end,
},
```

This configuration adds:
1. A `keymap` section to define Ctrl+q for selecting all items and accepting
2. An `actions` section that defines what happens when Ctrl+q is pressed in different contexts
3. The `file_sel_to_qf` action that sends selected entries to the quickfix list

## Usage

1. Search for files or grep for text using your existing keybindings:
   - `<Leader>ff` - Search files
   - `<Leader>fg` - Grep project

2. When the search results appear, you can:
   - Press `Ctrl+q` to send all results to the quickfix list
   - Select specific items first (using tab) and then press `Ctrl+q` to send only those to the quickfix list

3. Navigate the quickfix list using your existing keybindings:
   - `]q` - Next quickfix item
   - `[q` - Previous quickfix item
   - `<leader>xq` - Open the quickfix list in Trouble
