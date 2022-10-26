-- automatically install packer if it is not installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Lots of plugins are dependent on this
	use({ "nvim-lua/plenary.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		{ "neovim/nvim-lspconfig" },
	})

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Snippets
	use("rafamadriz/friendly-snippets")

	-- Formatting, Diagnostics, Code Actions
	use("jose-elias-alvarez/null-ls.nvim")
	-- use("~/workspace/null-ls.nvim")
	use("jiangmiao/auto-pairs")

	-- Testing
	use("vim-test/vim-test")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("RRethy/nvim-treesitter-textsubjects")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Icons for plugsin
	use("kyazdani42/nvim-web-devicons")

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Comment.nvim
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release",
	})
	use({ "sindrets/diffview.nvim" })
	use("tpope/vim-fugitive")

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Themes
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Doc Comments
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	-- Note taking
	use({ "vimwiki/vimwiki" })

	-- Frequent file navigation
	use({ "ThePrimeagen/harpoon" })

	-- Terminal
	use({ "numToStr/FTerm.nvim" })

	--Mini.nvim (collection of useful utilities)
	use({ "echasnovski/mini.nvim", branch = "stable" })

	--Improves startup time
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
