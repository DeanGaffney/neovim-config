local M = {}

M.edit_markdown_file = function(file_path, opts)
  if opts == nil then
    opts = {}
  end

  vim.cmd('e ' .. file_path)

  -- add the given text to the buffer
  if (opts.lines ~= nil) then
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local lines = opts.lines
    -- vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, lines)
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
  end
end

M.create_user_named_markdown_file = function(base_dir)
  local user_input = vim.fn.input("File Name: ", "", "file")
  local file_name = user_input .. ".md"
  local modified_file_name = file_name:gsub("%s+", "_"):lower()
  local full_path = vim.fs.joinpath(base_dir, modified_file_name)
  local header = "# " .. user_input
  M.edit_markdown_file(full_path, { lines = { header } })
end

M.create_daily_note = function(base_dir)
  local current_date = os.date('%Y-%m-%d')
  local file_name = current_date .. '.md'
  local full_path = vim.fs.joinpath(base_dir, file_name)

  -- file already exists, just open it to be edited
  if vim.fn.filereadable(full_path) == 1 then
    vim.cmd('e ' .. full_path)
    return
  end

  -- if the daily notes file does not exist, create it and
  -- place todays date as a header
  local header = "# " .. current_date .. " Daily Notes"
  local yesterday_header = "# What I done yesterday"
  local today_header = "# What I am doing today"
  M.edit_markdown_file(full_path,
    { lines = { header, "", yesterday_header, "", today_header } })
end

return M
