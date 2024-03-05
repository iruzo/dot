return {

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = true,
    keys = {
      { '<leader>t', ':ToggleTerm direction=horizontal <CR>', silent = true, desc = 'Terminal' },
    },
  }

}
