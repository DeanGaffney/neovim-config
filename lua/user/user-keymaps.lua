-- General keymap settings
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

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

-- Telescope lsp
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

-- nvim-tree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

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

-- FTerm
vim.api.nvim_set_keymap("n", "<leader>ft", ':lua require("FTerm").toggle()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap(
  "t",
  "<leader>ft",
  '<C-\\><C-n>:lua require("FTerm").toggle()<CR>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>fe", ':lua require("FTerm").exit()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap(
  "t",
  "<leader>fe",
  '<C-\\><C-n>:lua require("FTerm").exit()<CR>',
  { silent = true, noremap = true }
)

-- Git
vim.api.nvim_set_keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dvh", "<cmd>DiffviewFileHistory %<cr>", { silent = true, noremap = true })

-- Zen mode
vim.api.nvim_set_keymap("n", "<leader>zm", "<cmd>ZenMode<cr>", { silent = true, noremap = true })

-- Note Taking
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>Telekasten panel<CR>", { silent = true, noremap = true })

-- Most used functions
vim.api.nvim_set_keymap("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", { silent = true, noremap = true })

-- Call insert link automatically when we start typing a link
vim.api.nvim_set_keymap("i", "[[", "<cmd>Telekasten insert_link<CR>", { silent = true, noremap = true })
