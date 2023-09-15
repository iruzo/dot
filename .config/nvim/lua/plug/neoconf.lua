return {

  {
    'folke/neoconf.nvim',
    tag = 'stable',
    event = 'VeryLazy',
    cond = function()
      return vim.fn.isdirectory '.vscode' ~= 0
    end,
    opts = true,
  },

}
