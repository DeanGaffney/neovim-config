-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 10
vim.opt.conceallevel = 2
vim.opt.fileencoding = "utf-8"
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«", nbsp = "␣" }

-- Set font for GUI clients (like Neovide)
vim.opt.guifont = "UbuntuMono Nerd Font Mono:h14"

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable some built-in plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Disable Ruby and Perl providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set colorscheme options
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
