local state_dir = vim.fn.stdpath("state") .. "/last-file-by-cwd"
vim.fn.mkdir(state_dir, "p")

local function key_for_cwd()
  local cwd = vim.fn.getcwd()
  return cwd:gsub("[/\\:]", "%%")
end

local function state_file()
  return state_dir .. "/" .. key_for_cwd()
end

local function is_git_repository()
  return vim.fn.isdirectory(vim.fn.getcwd() .. "/.git") == 1
end

local function read_saved_file()
  local file = state_file()
  if vim.fn.filereadable(file) == 0 then
    return nil
  end

  local lines = vim.fn.readfile(file)
  if #lines == 0 or lines[1] == "" then
    return nil
  end

  return lines[1]
end

local function write_saved_file(path)
  if not path or path == "" then
    return
  end

  -- only store normal files
  if vim.fn.filereadable(path) == 0 then
    return
  end

  vim.fn.writefile({ path }, state_file())
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if not is_git_repository() then
      return
    end

    -- only when started as plain `nvim`
    if vim.fn.argc() ~= 0 then
      return
    end

    local path = read_saved_file()
    if not path then
      return
    end

    -- only reopen if the file still exists
    if vim.fn.filereadable(path) == 1 then
      vim.schedule(function()
        vim.cmd("edit " .. vim.fn.fnameescape(path))
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if not is_git_repository() then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)

    -- skip unnamed buffers and special buffers
    if name == "" or vim.bo[buf].buftype ~= "" then
      return
    end

    write_saved_file(name)
  end,
})
