-- General keymap settings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true } )

-- lspsaga, better UI diagnostics for lsp
vim.api.nvim_set_keymap('n', '<silent>K', ':Lspsaga hover_doc', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('i', '<C-k>', ':Lspsaga signature_help', { noremap = true, silent = true} )
