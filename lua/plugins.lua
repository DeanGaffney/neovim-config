-- automatically install packer if it is not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
   'nvim-telescope/telescope.nvim', 
   requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Themes
  use 'EdenEast/nightfox.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
