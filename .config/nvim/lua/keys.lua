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

--concat
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

--indent
vim.api.nvim_set_keymap('v', '>', '>><Esc>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<<<Esc>gv', { noremap = true })

--find
-- vim.api.nvim_set_keymap('n', '<space>h', ':vimgrep  */** | copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>', { noremap = true })

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
  if vim.lsp.buf.format() then
  else
    vim.api.nvim_command('normal gg=G')
  end
end
vim.api.nvim_set_keymap('n', '<C-f>', ':lua superformat()<CR>', { noremap = true })

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
