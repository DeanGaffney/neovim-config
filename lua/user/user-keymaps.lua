local notes = require("user.notes")
local home = os.getenv("HOME")

-- General keymap settings
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Pane Navigation
vim.api.nvim_set_keymap("n", "gk", "<C-W><C-K>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "<C-W><C-J>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "<C-W><C-L>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gh", "<C-W><C-H>", { noremap = true, silent = true })

-- Insert line above/below without entering insert mode
vim.api.nvim_set_keymap("n", "oo", "o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "OO", "O<Esc>", { noremap = true, silent = true })

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copy in visual mode and paste without losing clipboard contents
vim.keymap.set("x", "<leader>p", [["_dP]])

-- FZF-Lua files
vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":FzfLua grep_project<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fa",
  ":FzfLua files show_hidden=true no_ignore=true<CR>",
  { noremap = true, silent = true }
)

-- FZF-Lua lsp
vim.api.nvim_set_keymap("n", "<Leader>lr", ":FzfLua lsp_references<CR>", { noremap = true, silent = true })

-- Remove the global workspace symbols mapping since we're handling it in lsp-on-attach.lua
-- vim.api.nvim_set_keymap("n", "<Leader>so", ":FzfLua lsp_live_workspace_symbols<CR>", { noremap = true, silent = true })

-- FZF-Lua git
vim.api.nvim_set_keymap("n", "<Leader>gf", ":FzfLua git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gc", ":FzfLua git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":FzfLua git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":FzfLua git_status<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })

-- FZF-Lua general
vim.api.nvim_set_keymap("n", "<Leader>km", ":FzfLua keymaps<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":FzfLua help_tags<CR>", { noremap = true, silent = true })

-- Quickfix list
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

-- Testing
vim.api.nvim_set_keymap("n", "<Leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ts", ":TestSuite<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })

-- Neogen
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })

-- Trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xc", "<cmd>TroubleClose<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- Diagnostics
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>vim.diagnostic.open_float<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>vim.diagnostic.setloclist<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev()
end, { silent = true, noremap = true })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next({ severity = nil, float = true, forward = true })
end, { silent = true, noremap = true })

-- Harpoon
vim.api.nvim_set_keymap(
  "n",
  "<leader>m",
  ":lua require('harpoon.mark').add_file()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>1",
  ":lua require('harpoon.ui').nav_file(1)<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>2",
  ":lua require('harpoon.ui').nav_file(2)<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>3",
  ":lua require('harpoon.ui').nav_file(3)<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>4",
  ":lua require('harpoon.ui').nav_file(4)<CR>",
  { silent = true, noremap = true }
)

-- Zen mode
vim.api.nvim_set_keymap("n", "<leader>zm", "<cmd>ZenMode<cr>", { silent = true, noremap = true })

-- Oil
vim.api.nvim_set_keymap(
  "n",
  "<leader>-",
  "<cmd>Oil<cr>",
  { silent = true, noremap = true, desc = "Open parent directory" }
)

-- Notes
vim.api.nvim_set_keymap("n", "<leader>nd", "", {
  silent = true,
  noremap = true,
  desc = "Create a notes file for daily notes",
  callback = function()
    notes.create_daily_note(home .. "/notes/work/genesys/daily")
  end,
})

vim.api.nvim_set_keymap("n", "<leader>nm", "", {
  silent = true,
  noremap = true,
  desc = "Create a notes file related to a specific meeting",
  callback = function()
    notes.create_user_named_markdown_file(home .. "/notes/work/genesys/meetings")
  end,
})

vim.api.nvim_set_keymap("n", "<leader>nt", "", {
  silent = true,
  noremap = true,
  desc = "Create a notes file related to a specific task",
  callback = function()
    notes.create_user_named_markdown_file(home .. "/notes/work/genesys/tasks")
  end,
})

vim.api.nvim_set_keymap("n", "<leader>npn", "", {
  silent = true,
  noremap = true,
  desc = "Create a new personal note file",
  callback = function()
    notes.create_user_named_markdown_file(home .. "/notes/personal")
  end,
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>fn",
  "<cmd>FzfLua files cwd=~/notes<CR>",
  { silent = true, noremap = true, desc = "Search notes folder" }
)
