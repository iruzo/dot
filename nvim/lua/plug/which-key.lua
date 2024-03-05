return {

  {
    'folke/which-key.nvim',
    tag = 'stable',
    event = 'VeryLazy',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
      require'which-key'.setup()
    end
  },

}
