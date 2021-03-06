local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(clients)
			-- filter out clients that you don't want to use
			return vim.tbl_filter(function(client)
				return client.name ~= "tsserver" or "jsonls"
			end, clients)
		end,
		bufnr = bufnr,
	})
end

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

require("null-ls").setup({
	debug = true,
	sources = {
		-- lua
		formatting.stylua,
		-- completion.luasnip,
		-- javascript
		formatting.eslint_d,
		code_actions.eslint_d,
		-- python
		diagnostics.flake8,
		formatting.black,
		-- shell
		code_actions.shellcheck,
		diagnostics.shellcheck,
		formatting.shfmt,
		-- writing
		code_actions.proselint,
		diagnostics.proselint,
		-- spelling
		diagnostics.codespell,
		formatting.codespell,
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
	on_attach = on_attach,
})
