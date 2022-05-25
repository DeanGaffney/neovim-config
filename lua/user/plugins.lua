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

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("nvim-lsp-installer").setup({
					automatic_installation = false,
					ui = {
						icons = {
							server_installed = "✓",
							server_pending = "➜",
							server_uninstalled = "✗",
						},
					},
				})
			end,
		},
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
	use("windwp/nvim-autopairs")

	-- Formatting, Diagnostics, Code Actions
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

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
	-- Themes
	use({ "ellisonleao/gruvbox.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
