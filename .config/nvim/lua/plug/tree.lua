return {

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'MunifTanjim/nui.nvim' },
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree toggle=true position=right<CR>', silent = true, desc = 'File Explorer' },
    },
    opts = true,
  },

}
