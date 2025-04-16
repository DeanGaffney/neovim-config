require("lint").linters_by_ft = {
  -- python
  python = { "pylint" },
  -- javascript/typescript
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  -- spelling
  markdown = { "codespell" },
  text = { "codespell" },
  -- docker
  dockerfile = { "hadolint" },
  -- yaml
  yaml = { "yamllint" },
  -- shell scripts
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },
}

-- Create an autocommand group for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Set up lint on save and other events
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

-- Create a command to manually trigger linting
vim.api.nvim_create_user_command("Lint", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })
