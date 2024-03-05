-- Focus gained and buffer events
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end
})

-- Filetype settings for specific file patterns
local filetypes = {
  {pattern = '*.gpg', ft = 'gpg'},
  {pattern = '*.pgp', ft = 'pgp'},
  {pattern = '*.asc', ft = 'asc'},
  {pattern = '*DOCKERFILE*', ft = 'dockerfile'},
  {pattern = '*Dockerfile*', ft = 'dockerfile'},
}

for _, ft in ipairs(filetypes) do
  vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { pattern = ft.pattern, command = 'set filetype=' .. ft.ft })
end

-- Remove trailing whitespace and blank lines at end of file on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.cmd([[%s/\s\+$//e]]) -- white spaces
    vim.cmd([[silent! %s#\($\n\s*\)\+\%$##]]) -- blank lines
  end,
})

-- Autoformat email files on save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.eml*',
  command = [[%norm! gww | w]],
})

-- Function to close all buffers except current
function bd_all()
  vim.cmd('%bd|e#')
end

-- Windows specific settings
if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.opt.shell = 'powershell'
  vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  vim.opt.shellquote = '\"'
  vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s'
  vim.opt.shellredir = '| Out-File -Encoding UTF8 %s'
end

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.scrolloff = 0
  end,
})

-- General settings
vim.opt.syntax = 'on'
vim.opt.eof = true
vim.opt.shortmess:append('sI') -- disable nvim intro
vim.opt.path:append('**')
vim.opt.wildignore = '**/.git/*,**/_build/*,**/coverage/*,**/.cache/*,**/venv/*,**/svn/*,**/target/*'
vim.opt.list = true
vim.opt.listchars:append('eol:·')
vim.opt.listchars = { tab = '| ', trail = '·' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.errorbells = false
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.encoding = 'utf-8'
vim.opt.mouse = 'v'
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 80
vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2 -- indent
vim.opt.expandtab = true -- indent
vim.opt.smartindent = true -- indent
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.sidescroll = 1
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildmenu = true
vim.opt.wildmode = {'list:longest', 'full'}
vim.opt.wildignorecase = true
vim.opt.viminfo = ''
vim.opt.guicursor = ''
vim.g.multi_cursor_exit_from_visual_mode = 0

-- Mail-specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'mail',
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
    -- vim.opt_local.fo:append('aw')
  end
})

-- -- Netrw settings (commented)
-- vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 10
-- vim.g.netrw_list_style = 3
