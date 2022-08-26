-- nvim settings
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_set_option("smartindent", true)
vim.api.nvim_set_option("tabstop", 2)
vim.api.nvim_set_option("shiftwidth", 2)
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_win_set_option(0, "number", true)
vim.api.nvim_win_set_option(0, "relativenumber", true)
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.api.nvim_set_option("swapfile", false)
vim.api.nvim_set_option("backup", false)
vim.api.nvim_set_option("undodir", os.getenv("HOME") .. "/.vim/undodir")
vim.api.nvim_set_option("undofile", true)
vim.api.nvim_set_option("hlsearch", false)
vim.api.nvim_set_option("incsearch", true)
vim.api.nvim_set_option("termguicolors", true)
vim.api.nvim_set_option("scrolloff", 15)
vim.api.nvim_set_option("signcolumn", "yes")
vim.api.nvim_set_option("cmdheight", 1)

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.api.nvim_set_option("updatetime", 20)
