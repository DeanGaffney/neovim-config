local M = {}

M.edit_markdown_file = function(file_path, opts)
  if opts == nil then
    opts = {}
  end

  vim.cmd('e ' .. file_path)

  -- add the given text to the buffer
  if (opts.text ~= nil or opts.text ~= '') then
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local text = opts.text
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { text })
  end
end

M.create_user_named_markdown_file = function(base_dir)
  local user_input = vim.fn.input("File Name: ", "", "file")
  local file_name = user_input .. ".md"
  local modified_file_name = file_name:gsub("%s+", "_"):lower()
  print("MODIFIED " .. modified_file_name)
  local full_path = vim.fs.joinpath(base_dir, modified_file_name)
  local header = "# " .. user_input
  M.edit_markdown_file(full_path, { text = header })
end

return M
