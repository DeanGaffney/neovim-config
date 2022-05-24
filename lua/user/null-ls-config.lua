local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.name == "tsserver" then                                                                                                   
        client.server_capabilities.document_formatting = false -- 0.7 and earlier
        -- client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
    end
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end

require("null-ls").setup({
  sources = {
    -- lua
    formatting.stylua,
    -- completion.luasnip,
    -- javascript
    formatting.eslint_d,
    diagnostics.eslint_d,
    code_actions.eslint_d,
    -- python
    diagnostics.flake8,
    formatting.black,
    -- -- shell
    -- code_actions.shellcheck,
    -- diagnostics.shellcheck,
    -- formatting.shfmt,
    -- -- spelling
    -- diagnostics.codespell,
    -- formatting.codespell,
    -- -- docker
    -- diagnostics.hadolint,
    -- -- yaml
    -- diagnostics.yamllint,
    -- -- refactoring
    -- code_actions.refactoring,
    -- -- markdown
    -- diagnostics.markdownlint,
    -- formatting.markdownlint
  },
  on_attach = on_attach
})
