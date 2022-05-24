-- nvim settings
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_set_option("smartindent", true)
vim.api.nvim_set_option("tabstop", 2)
vim.api.nvim_set_option("shiftwidth", 2)
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_win_set_option(0, "number", true)
vim.api.nvim_win_set_option(0, "relativenumber", true)
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- theme settings
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
