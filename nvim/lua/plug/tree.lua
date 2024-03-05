return {

  {
    'echasnovski/mini.files',
    version = '*',
    opts = true,
    keys = {
      { '<leader>E', ':lua MiniFiles.open()<CR>', silent = true, desc = 'File Explorer' },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      { 'nvim-lua/plenary.nvim', version = '*' },
      { 'nvim-tree/nvim-web-devicons', version = '*' },
      { 'MunifTanjim/nui.nvim', version = '*' },
    },
    keys = {
      { '<leader>e', ':Neotree toggle=true position=right<CR>', silent = true, desc = 'File Explorer' },
    },
    opts = true,
  },

}
