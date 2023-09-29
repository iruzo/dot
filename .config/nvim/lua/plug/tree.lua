return {

  {
    'nvim-neo-tree/neo-tree.nvim',
    tag = '2.69',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'MunifTanjim/nui.nvim', tag = '0.1.0', },
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree toggle=true position=right<CR>', silent = true, desc = 'File Explorer' },
    },
    opts = true,
  },

}
