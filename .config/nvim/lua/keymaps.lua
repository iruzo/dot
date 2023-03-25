vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '?', ':noh <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-s>', ':%sort u', { noremap = true })
vim.api.nvim_set_keymap('n', 'tt', ':split<enter> :wincmd j<enter> :terminal<enter> i', { noremap = true })

--movement
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true })
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

--concat
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

--pair braces
vim.api.nvim_set_keymap('i', '<', '<><Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '\'', '\'\'<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '`', '``<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '*', '**<Left>', { noremap = true })

--indent
vim.api.nvim_set_keymap('v', '>', '>><Esc>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<<<Esc>gv', { noremap = true })

-- undo
-- vim.api.nvim_set_keymap('n', 'U', ':undolist<enter>', { noremap = true })

--replace
vim.api.nvim_set_keymap('n', '<C-/>', ':%s///g<Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '/', 'y/<C-R>=escape(@",\'/\\\')<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-/>', 'y:%s/<C-R>=escape(@",\'/\\\')<CR>//g<Left><Left>', { noremap = true })

--save
vim.api.nvim_set_keymap('n', '<C-s>', ':w <enter>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<esc> <esc> :w <enter>', { noremap = true })

--exit
vim.api.nvim_set_keymap('n', '<C-q>', ':q <enter>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<C-c> :q <enter>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>', { noremap = true })

--tags
vim.api.nvim_set_keymap('n', 'gt', ':tag <c-r>=expand("<cword>")<cr> <enter>', { noremap = true })

--plugins
vim.api.nvim_set_keymap('n', 'W', '<Plug>(DBUI_SaveQuery)', { noremap = true })

function superformat()
  if vim.lsp.buf.format() then
  else
    vim.api.nvim_command('normal gg=G')
  end
end

vim.api.nvim_set_keymap('n', 'ff', ':lua superformat()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true }) --open code actions using the default lsp UI
vim.api.nvim_set_keymap('x', 'ca', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true }) --open code actions for the selected visual range

--dap
vim.api.nvim_set_keymap('n', '<F1>', ':DapToggleBreakpoint<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', ':lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', ':lua require"dap".step_back()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F4>', ':lua require"dap".step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', ':lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".terminate()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F9>', ':lua require"dapui".toggle()<CR>', { noremap = true })

--git
vim.api.nvim_set_keymap('n', '<C-g>', ':Gitsigns preview_hunk <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-r>', ':Gitsigns reset_hunk <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':Gitsigns next_hunk <enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Gitsigns prev_hunk <enter>', { noremap = true })

-- telescope
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':Telescope diagnostics<CR>', { noremap = true })

--explorer
vim.api.nvim_set_keymap('n', 'ee', ':NvimTreeToggle<CR>', { noremap = true })

--undotree
vim.api.nvim_set_keymap('n', 'U', ':UndotreeToggle<CR>', { noremap = true })

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
