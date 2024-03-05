return {

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
      { '<C-t><C-t>', ':ToggleTerm direction=tab<CR>',        silent = true, desc = 'toggle term tab' },
      { '<C-t><C-f>', ':ToggleTerm direction=float<CR>',      silent = true, desc = 'toggle term float' },
      { '<C-t><C-v>', ':ToggleTerm direction=vertical<CR>',   silent = true, desc = 'toggle term vertical' },
      { '<C-t><C-s>', ':ToggleTerm direction=horizontal<CR>', silent = true, desc = 'toggle term horizontal' },
    }
  }

}
