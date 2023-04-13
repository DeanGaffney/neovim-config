-- automatically install lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Lots of plugins are dependent on this
  { "nvim-lua/plenary.nvim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- LSP
  { "williamboman/mason.nvim",                  lazy = false,  build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim",        lazy = false },
  { "neovim/nvim-lspconfig",                    lazy = false },

  -- LSP - Java
  { "mfussenegger/nvim-jdtls" },

  -- Lsp status
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },

  -- Snippets
  { "rafamadriz/friendly-snippets" },

  -- Formatting, Diagnostics, Code Actions
  { "jose-elias-alvarez/null-ls.nvim" },

  { "jiangmiao/auto-pairs" },

  -- Testing
  { "vim-test/vim-test" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
  -- Additional textobjects for treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "RRethy/nvim-treesitter-textsubjects" },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Icons for plugsin
  { "kyazdani42/nvim-web-devicons",               lazy = true },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Git
  { "sindrets/diffview.nvim" },
  { "tpope/vim-fugitive" },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  },

  -- File Explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("nvim-tree").setup()
    end,
    version = "nightly", -- optional, updated every week. (see issue #1193)
  },

  -- Themes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- Doc Comments
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  -- Note taking
  {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_global_ext = 0
    end,
  },

  -- Frequent file navigation
  { "ThePrimeagen/harpoon" },

  -- Terminal
  { "numToStr/FTerm.nvim" },

  -- Surround utility
  { "tpope/vim-surround" },

  { "mzlogin/vim-markdown-toc" },

  -- TMUX
  { "christoomey/vim-tmux-navigator" },
}

require("lazy").setup(plugins)
