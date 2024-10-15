local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local get_opts = function(bufnr)
  return { noremap = true, silent = true, buffer = bufnr }
end

local lsp_format = function(bufnr)
  vim.lsp.buf.format({
    filter = function(_client)
      -- filter out clients that you don't want to use
      return _client.name ~= "tsserver" or "jsonls"
    end,
    bufnr = bufnr,
  })
end

local formatting = function(client, bufnr)
  local opts = get_opts(bufnr)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_format(bufnr)
      end,
    })

    vim.api.nvim_create_user_command("Format", function()
      lsp_format(bufnr)
    end, {})

    vim.keymap.set("n", "<leader>f", function()
      lsp_format(bufnr)
    end, opts)
  end
end

local default_on_attach = function(client, bufnr)
  local opts = get_opts(bufnr)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)

  vim.keymap.set(
    "v",
    "<space>ca",
    "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
  )

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      })
    end,
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi LspReferenceRead cterm=bold ctermbg=237 guibg=#45403d
      hi LspReferenceText cterm=bold ctermbg=237 guibg=#45403d
      hi LspReferenceWrite cterm=bold ctermbg=237 guibg=#45403d
    ]])
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  formatting(client, bufnr)
end

local M = {}

M.default = default_on_attach

return M
