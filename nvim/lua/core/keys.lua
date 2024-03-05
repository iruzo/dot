vim.g.mapleader = ' '

--movement
vim.keymap.set('i', '<C-h>', '<left>', { desc = '' })
vim.keymap.set('i', '<C-j>', '<down>', { desc = '' })
vim.keymap.set('i', '<C-k>', '<up>', { desc = '' })
vim.keymap.set('i', '<C-l>', '<right>', { desc = '' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = '' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = '' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = '' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = '' })

--clipboard
vim.keymap.set('x', 'p', '\"_dP', { desc = '' })

--indent
vim.keymap.set('v', '>', '>><Esc>gv', { desc = '' })
vim.keymap.set('v', '<', '<<<Esc>gv', { desc = '' })

-- tab
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>', { desc = '' })
vim.keymap.set('n', '<C-j>', ':tabnew<CR>', { desc = '' })
vim.keymap.set('n', '<C-k>', ':tabclose<CR>', { desc = '' })
vim.keymap.set('n', '<C-l>', ':tabnext<CR>', { desc = '' })

--find
-- vim.keymap.set('n', '<space>h', ':vimgrep  */** | copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>', { noremap = true })

-- block sum
function sum_column()
  local sum = 0
  -- visual selection range
  local _, start_line, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_line, end_col, _ = unpack(vim.fn.getpos("'>"))
  -- loop over every item of the range
  for line = start_line, end_line do
    local content = vim.api.nvim_buf_get_lines(0, line-1, line, false)[1]
    local number = string.sub(content, start_col, end_col)
    -- sum number
    if tonumber(number) then
      sum = sum + tonumber(number)
    end
  end
  print("Total Sum: " .. sum)
  vim.api.nvim_buf_set_lines(0, end_line, end_line, false, {tostring(sum)})
end
vim.keymap.set('v', '<C-s>', ':lua sum_column()<CR>', { desc = '' })

-- Function to select and print a random line from the visual selection
function pick_random_line()
  -- Get the visual selection range
  local _, start_line, _, _ = unpack(vim.fn.getpos("'<"))
  local _, end_line, _, _ = unpack(vim.fn.getpos("'>"))

  -- Create a table to hold the selected lines
  local selected_lines = {}

  -- Loop over every line in the range and add it to the table
  for line = start_line, end_line do
    local content = vim.api.nvim_buf_get_lines(0, line-1, line, false)[1]
    table.insert(selected_lines, content)
  end

  -- Generate a random index from the selected lines
  local random_index = math.random(#selected_lines)

  -- Print the randomly selected line
  local random_line = selected_lines[random_index]
  print("Random Line: " .. random_line)
  -- vim.api.nvim_buf_set_lines(0, end_line, end_line, false, {tostring(selected_lines[random_index])})
end
vim.keymap.set('v', '<C-r>', ':lua pick_random_line()<CR>', { desc = '' })

-- exec what is in the current line after the last pipe symbol (|) of the line
function execute_after_pipe()
  local line = vim.api.nvim_get_current_line()
  local command = line:match("|(.*)")
  if command and #command > 0 then
    vim.cmd("silent nohup " .. command .. " > /dev/null 2>&1 &")
    print("Executed: " .. command)
  else
    print("No command found")
  end
end
vim.keymap.set('n', '<C-x>', ':lua execute_after_pipe()<CR>', { desc = '' })
-- copy quickmark
vim.keymap.set('n', '<C-y>', 'g_F|lvg_y', { desc = '' })
-- copy ascii
vim.keymap.set('n', '<C-i>', [[:let @+=system("awk -F'|' '{print $NF}' \| tr ' ' '\\n'", getline('.'))<CR>]], { desc = '' })

-- :nnoremap <F, silent = true2> :let @+=system("awk -F'|' '{print $NF}' \| tr ' ' '\\n'", getline('.'))<CR>

--replace
vim.keymap.set('n', '<C-/>', ':%s///g<Left><Left>', { desc = '' })
vim.keymap.set('v', '/', 'y/<C-R>=escape(@",\'/\\\')<CR><CR>', { desc = '' })
vim.keymap.set('v', '<C-/>', 'y:%s/<C-R>=escape(@",\'/\\\')<CR>//g<Left><Left>', { desc = '' })

--save
vim.keymap.set('n', '<C-s>', ':w <enter>', { desc = '' })
vim.keymap.set('i', '<C-s>', '<esc> <esc> :w <enter>', { desc = '' })

--exit
vim.keymap.set('n', '<C-q>', ':q <enter>', { desc = '' })
vim.keymap.set('i', '<C-q>', '<ESC> :q <enter>', { desc = '' })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { desc = '' })

--tags
vim.keymap.set('n', 'gt', ':tag <c-r>=expand("<cword>")<cr> <enter>', { desc = '' })

--terminal
vim.keymap.set('n', 'tt', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 10)
end)

--plugins

--lsp
function superformat()
  if not vim.lsp.buf.format() then
    vim.api.nvim_command('normal gg=G')
  end
end
function superformat_range()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  if not vim.lsp.buf.format({
    range = {
      start = { start_pos[2], start_pos[3] - 1 },
      ['end'] = { end_pos[2], end_pos[3] - 1 }
    }
  }) then
    vim.api.nvim_command('normal =')
  end
end
vim.keymap.set('n', '<C-f>', function() superformat() end, { desc = '' })
vim.keymap.set('v', '<C-f>', function() superformat_range() end, { desc = 'Format selection' })
vim.keymap.set('x', '<C-f>', function() superformat_range() end, { desc = 'Format selection' })

--netrw
-- vim.keymap.set('n', 'ee', ':Lexplore <CR>', { desc = '' })

-- vim.cmd([[
-- function! NetrwMapping()
-- "rename
-- nmap <buffer> r R
-- "create file
-- nmap <buffer> a %
-- "create folder
-- nmap <buffer> A :call <SNR>77_NetrwMakeDir("")<CR>
-- "delete
-- nmap <buffer> d D
-- endfunction

-- augroup netrw_mapping
-- autocmd!
-- autocmd filetype netrw call NetrwMapping()
-- augroup END
-- ]])
