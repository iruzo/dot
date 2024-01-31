return {

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', version = '*' },
      { 'MunifTanjim/nui.nvim', version = '*' },
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree toggle=true position=right<CR>', silent = true, desc = 'File Explorer' },
    },
    opts = true,
  },

}
