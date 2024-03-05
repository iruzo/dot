return {

  {
    'folke/zen-mode.nvim',
    tag = 'stable',
    opts = {
      plugins = {
        twilight = { enabled = true },
      }
    },
    dependencies = {
      { 'folke/twilight.nvim', opts = true }
    },
    keys = {
      { 'zz', ':ZenMode<CR>', silent = true, desc = 'File Explorer' },
    },
  },

}
