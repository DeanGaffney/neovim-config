local home = os.getenv("HOME")

local obsidian_directory = home .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents"

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

-- Telescope files
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fa",
  ":Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { noremap = true, silent = true }
)

-- Telescope LSP
vim.api.nvim_set_keymap("n", "<Leader>lr", ":Telescope lsp_references<CR>", { noremap = true, silent = true })

-- Telescope git
vim.api.nvim_set_keymap("n", "<Leader>gf", ":Telescope git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gc", ":Telescope git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Telescope git_status<CR>", { noremap = true, silent = true })

-- Telescope general
vim.api.nvim_set_keymap("n", "<Leader>km", ":Telescope keymaps<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

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
vim.api.nvim_set_keymap("n", "<leader>nd", "<cmd>ObsidianToday<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>fn",
  "<cmd>ObsidianSearch<CR>",
  { silent = true, noremap = true, desc = "Search notes folder" }
)
-- Find and Replace (nvim-spectre)
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
vim.keymap.set("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })
