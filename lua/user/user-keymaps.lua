-- General keymap settings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true } )

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope files
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Telescope git
vim.api.nvim_set_keymap('n', '<Leader>gf', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Telescope git_branches<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', { noremap = true, silent = true })

-- Quickfix list
vim.api.nvim_set_keymap('n', 'q]', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q[', ':cprev<CR>', { noremap = true, silent = true })
