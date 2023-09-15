return {

  {
    'nvim-focus/focus.nvim',
    tag = 'v1.0.0',
    cmd = 'Focus',
    keys = {
      { '<C-w><C-v>', ':FocusSplitRight<CR>', silent = true, desc = 'split right' },
      { '<C-w><C-s>', ':FocusSplitDown<CR>', silent = true, desc = 'split down' },
    },
    opts = true,
  },

}
