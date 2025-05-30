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
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        wrap_results = true,
        layout_strategy = "vertical",
        file_ignore_patterns = {
          "node_modules",
          ".git",
          "venv",
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- LSP
  { "williamboman/mason.nvim",           lazy = false, build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  { "neovim/nvim-lspconfig",             lazy = false },

  -- Lsp status
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
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
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { "rafamadriz/friendly-snippets" },

  -- Formatting, Diagnostics, Code Actions
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
  },

  { "jiangmiao/auto-pairs" },

  -- Testing
  { "vim-test/vim-test" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
  -- Additional textobjects for treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "RRethy/nvim-treesitter-textsubjects" },
  { "nvim-treesitter/nvim-treesitter-context" },

  {
    "yamatsum/nvim-cursorline",
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Icons for plugsin
  { "kyazdani42/nvim-web-devicons", lazy = true },

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
  { "akinsho/git-conflict.nvim",    version = "*", config = true },
  { "tpope/vim-fugitive" },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- File Explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Options: storm, moon, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
        sidebars = { "qf", "help", "terminal", "packer" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = true,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
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

  -- Frequent file navigation
  { "ThePrimeagen/harpoon" },

  -- Surround utility
  { "tpope/vim-surround" },

  -- TMUX
  { "christoomey/vim-tmux-navigator" },

  -- Zen Mode
  { "folke/zen-mode.nvim" },

  -- Obsidian Notes
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    disable_frontmatter = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents",
        },
      },
      picker = {
        name = "telescope",
      },
      templates = {
        folder = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/templates",
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "work/genesys/daily",
        template =
        "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work/genesys/daily/Genesys Daily Notes Template.md",
      },
    },
  },
}

require("lazy").setup(plugins)
