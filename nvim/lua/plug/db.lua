return {

  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = 'DBUI',
    dependencies = {
      {
        'tpope/vim-dadbod',
        version = '*',
        config = function()
          vim.g.db_ui_save_location = '~/.local/data/nvim/dbui'
          vim.keymap.set('n', 'W', '<Plug>(DBUI_SaveQuery)', { desc = '' })
        end,
        dependencies = {
          { 'kristijanhusak/vim-dadbod-completion' },
        }
      }
    }
  },

}
