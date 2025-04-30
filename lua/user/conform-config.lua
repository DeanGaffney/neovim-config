require("conform").setup({
  formatters_by_ft = {
    -- lua
    lua = { "stylua" },
    -- json
    json = { "jq" },
    -- java
    java = { "google_java_format" },
    -- javascript
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    -- python
    python = { "black" },
    -- shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    -- golang
    go = { "gofmt", "goimports" },
    -- yaml
    yaml = { "yamlfmt" },
  },

  -- Set up format-on-save
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,

  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
})

-- Create commands to toggle formatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting globally
    vim.g.disable_autoformat = true
  else
    vim.b.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable autoformat-on-save",
})

-- Create a format command
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, 0 },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Add keymapping for formatting
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format document" })
