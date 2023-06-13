vim.api.nvim_command('autocmd BufRead,BufWrite * if ! &bin | silent! %s/\\s\\+$//ge | endif')
vim.api.nvim_command('autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != "c" | checktime | endif')
-- filetype syntax
vim.api.nvim_command('autocmd BufNewFile,BufRead * if expand(\'%:t\') !~ \'\\.\' | set syntax=sh | endif')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.nix :set filetype=perl')
-- vim.api.nvim_command('autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), " ")')

vim.opt.shortmess:append "sI" -- disable nvim intro
vim.opt.path = vim.opt.path + '**'
vim.opt.wildignore = '**/.git/*,*_build/*,**/coverage/*'
-- vim.opt.autochdir = true
vim.opt.list = true
vim.opt.lcs = 'tab:| ,trail:·'
-- NEVER set title to true, it can create graphical bugs in gpu accelerated terminal emulators
-- vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
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
vim.opt.laststatus = 0

vim.opt.guicursor = ""
vim.g.multi_cursor_exit_from_visual_mode = 0

-- -- netrw
-- vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 10

-- real time lsp ghost text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    update_in_insert = true,
    signs = true,
  }
)

-- disable builtin
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_syntax = 1
vim.g.loaded_synmenu = 1
vim.g.loaded_optwin = 1
vim.g.loaded_compiler = 1
vim.g.loaded_bugreport = 1
vim.g.loaded_ftplugin = 1
vim.g.loaded_fzf = 1
