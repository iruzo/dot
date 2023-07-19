vim.api.nvim_command('autocmd BufRead,BufWrite * if ! &bin | silent! %s/\\s\\+$//ge | endif')
vim.api.nvim_command('autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != "c" | checktime | endif')
-- filetype syntax
vim.api.nvim_command('autocmd BufNewFile,BufRead * if expand(\'%:t\') !~ \'\\.\' | set syntax=sh | endif')
-- vim.api.nvim_command('autocmd BufNewFile,BufRead *.nix :set filetype=perl')
-- new filetype gpg, pgp, asc
vim.api.nvim_command('autocmd BufRead,BufNewFile *.gpg :set filetype=gpg')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.pgp :set filetype=pgp')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.asc :set filetype=asc')
-- vim.api.nvim_command('autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), " ")')

function bd_all()
  vim.api.nvim_command('%bd|e#');
end

vim.opt.syntax = "yes"
vim.opt.shortmess:append "sI" -- disable nvim intro
vim.opt.path = vim.opt.path + '**'
-- vim.opt.path = vim.opt.path + '*./**'
vim.opt.wildignore = '**/.git/*,*_build/*,**/coverage/*,**/.cache/*,**/venv/*,**/svn/*,**/target/*'
-- vim.opt.autochdir = true
vim.opt.list = true
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
vim.opt.background = 'dark'
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~") .. "/.local/data/nvim/undodir"
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
vim.opt.colorcolumn = "80"
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignorecase = true
vim.opt.viminfo = ''

vim.opt.guicursor = ""
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
