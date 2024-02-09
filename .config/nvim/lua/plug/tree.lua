return {

  {
    'echasnovski/mini.files',
    version = '*',
    event = 'VeryLazy',
    opts = true,
    keys = {
      { '<leader>e', ':lua MiniFiles.open()<CR>', silent = true, desc = 'File Explorer' },
    },
  },

}
