return {

  {
    'echasnovski/mini.files',
    version = '*',
    opts = true,
    keys = {
      { '<leader>e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>', silent = true, desc = 'File Explorer' },
    },
  },

}
