-- Disable Ruby provider (since it's causing issues)
vim.g.loaded_ruby_provider = 0

-- Disable Perl provider (since it's not needed)
vim.g.loaded_perl_provider = 0

-- Load user configuration
require("user.user-keymaps")
require("user.user-settings")
require("user.user-commands")
require("user.plugins")
require("user.lsp")
require("user.conform-config")
require("user.nvim-lint-config")
require("user.treesitter-config")
require("user.lualine-config")
