return {

  {
    'folke/neoconf.nvim',
    tag = 'stable',
    cond = function()
      return vim.fn.isdirectory '.vscode' ~= 0
    end,
    opts = true,
  },

}
