local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'glepnir/lspsaga.nvim'
  use 'EdenEast/nightfox.nvim'
end)
