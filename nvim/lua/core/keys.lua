vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '?', ':noh <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-s>', ':%sort u', { noremap = true })

--movement
vim.api.nvim_set_keymap('i', '<C-h>', '<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', { noremap = true })
vim.api.nvim_set_keymap('n', 'H', ':bp <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', ':bn <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })

--clipboard
vim.api.nvim_set_keymap('x', 'p', '\"_dP', { noremap = true })

--indent
vim.api.nvim_set_keymap('v', '>', '>><Esc>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<<<Esc>gv', { noremap = true })

-- tab
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true })

--find
-- vim.api.nvim_set_keymap('n', '<space>h', ':vimgrep  */** | copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>', { noremap = true })

-- terminal
vim.api.nvim_set_keymap('n', 'tt', ':term<CR>', { noremap = true })

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
vim.api.nvim_set_keymap('v', '<C-s>', ':lua sum_column()<CR>', { noremap = true })

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
vim.api.nvim_set_keymap('v', '<C-r>', ':lua pick_random_line()<CR>', { noremap = true, silent = true })

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
vim.api.nvim_set_keymap('n', '<C-x>', ':lua execute_after_pipe()<CR>', { noremap = true, silent = true })
-- copy quickmark
vim.api.nvim_set_keymap('n', '<C-y>', 'g_F|lvg_y', { noremap = true })
-- copy ascii
vim.api.nvim_set_keymap('n', '<C-i>', [[:let @+=system("awk -F'|' '{print $NF}' \| tr ' ' '\\n'", getline('.'))<CR>]], { noremap = true })

-- :nnoremap <F2> :let @+=system("awk -F'|' '{print $NF}' \| tr ' ' '\\n'", getline('.'))<CR>

--replace
vim.api.nvim_set_keymap('n', '<C-/>', ':%s///g<Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '/', 'y/<C-R>=escape(@",\'/\\\')<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-/>', 'y:%s/<C-R>=escape(@",\'/\\\')<CR>//g<Left><Left>', { noremap = true })

--save
vim.api.nvim_set_keymap('n', '<C-s>', ':w <enter>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<esc> <esc> :w <enter>', { noremap = true })

--exit
vim.api.nvim_set_keymap('n', '<C-q>', ':q <enter>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<ESC> :q <enter>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>', { noremap = true })

--tags
vim.api.nvim_set_keymap('n', 'gt', ':tag <c-r>=expand("<cword>")<cr> <enter>', { noremap = true })

--plugins

--lsp
function superformat()
  if not vim.lsp.buf.format() then
    vim.api.nvim_command('normal gg=G')
  end
end
function superformat_range()
  if not vim.lsp.buf.range_formatting({}) then
    vim.api.nvim_command(':=<CR>')
  end
end
vim.api.nvim_set_keymap('n', '<C-f>', ':lua superformat()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-f>', ":lua vim.lsp.buf.range_formatting()<CR>", { noremap = true })
vim.api.nvim_set_keymap('x', '<C-f>', ":lua vim.lsp.buf.range_formatting()<CR>", { noremap = true })

--netrw
-- vim.api.nvim_set_keymap('n', 'ee', ':Lexplore <CR>', { noremap = true })

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
