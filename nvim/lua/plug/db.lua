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
          vim.api.nvim_set_keymap('n', 'W', '<Plug>(DBUI_SaveQuery)', { noremap = true })
        end,
        dependencies = {
          { 'kristijanhusak/vim-dadbod-completion' },
        }
      }
    }
  },

}
