local null_ls = require("null-ls")
local lsp_attach = require("user.lsp-on-attach")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require("null-ls").setup({
  debug = true,
  sources = {
    -- lua
    formatting.stylua,
    -- json
    require("none-ls.formatting.jq"),
    -- java
    formatting.google_java_format,
    -- javascript
    require("none-ls.formatting.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    -- python
    diagnostics.pylint,
    formatting.black,
    -- shell
    formatting.shfmt.with({
      extra_args = { "-i", "2" },
    }),
    -- spelling
    diagnostics.codespell,
    -- docker
    diagnostics.hadolint,
    -- -- yaml
    -- diagnostics.yamllint,
    -- -- refactoring
    -- code_actions.refactoring,
    -- cloudformation
    diagnostics.cfn_lint,
    --  golang
    -- formatting.gofmt,
    -- formatting.goimports,
    -- diagnostics.golangci_lint,
  },
  on_attach = lsp_attach.default,
})
