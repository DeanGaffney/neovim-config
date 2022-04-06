-- General keymap settings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true } )
-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- lspsaga, better UI diagnostics for lsp
vim.api.nvim_set_keymap('n', '<silent>K', ':Lspsaga hover_doc', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('i', '<C-k>', ':Lspsaga signature_help', { noremap = true, silent = true} )
