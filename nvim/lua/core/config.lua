vim.api.nvim_command('autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != "c" | checktime | endif')
-- new filetype gpg, pgp, asc
vim.api.nvim_command('autocmd BufRead,BufNewFile *.gpg :set filetype=gpg')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.pgp :set filetype=pgp')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.asc :set filetype=asc')
vim.api.nvim_command('autocmd BufRead,BufNewFile *DOCKERFILE* :set filetype=dockerfile')
vim.api.nvim_command('autocmd BufRead,BufNewFile *Dockerfile* :set filetype=dockerfile')

-- remove trailing white spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]], })

-- remove last empty lines
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\_s*\%$//e]], })

-- autoformat email files on save
vim.api.nvim_command('autocmd BufWrite *.eml* :%norm! gww<CR>:w<CR>')

function bd_all()
  vim.api.nvim_command('%bd|e#');
end

if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.opt.shell='powershell'
  -- vim.opt.shellxquote=
  vim.opt.shellcmdflag='-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  vim.opt.shellquote='\"'
  vim.opt.shellpipe='| Out-File -Encoding UTF8 %s'
  vim.opt.shellredir='| Out-File -Encoding UTF8 %s'
end

vim.opt.syntax = 'yes'
vim.opt.shortmess:append 'sI' -- disable nvim intro
vim.opt.path = vim.opt.path + '**'
-- vim.opt.path = vim.opt.path + '*./**'
vim.opt.wildignore = '**/.git/*,*_build/*,**/coverage/*,**/.cache/*,**/venv/*,**/svn/*,**/target/*'
-- vim.opt.autochdir = true
vim.opt.list = true
vim.opt.listchars:append 'eol:·'
vim.opt.lcs = 'tab:| ,trail:·'
-- NEVER set title to true, it can create graphical bugs in gpu accelerated terminal emulators
-- vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.ruler = true
-- vim.opt.laststatus = 0
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
vim.opt.sidescroll = 1
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignorecase = true
vim.opt.viminfo = ''

vim.opt.guicursor = ''
vim.g.multi_cursor_exit_from_visual_mode = 0

-- mail config
vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'
-- vim.opt_local.fo:append('aw')

-- -- netrw
-- vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 10
