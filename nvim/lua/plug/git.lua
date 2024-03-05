return {

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'sindrets/diffview.nvim',                           -- optional
    },
    opts = true;
  },

  {
    'lewis6991/gitsigns.nvim',
    version = '*',
    event = 'VeryLazy',
    -- cond = function()
    --   if vim.fn.isdirectory '.git' ~= 0 then
    --     return true
    --   end
    -- end,
    config = function()
      vim.api.nvim_set_keymap('n', '<C-g>', ':Gitsigns preview_hunk <enter>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-r>', ':Gitsigns reset_hunk <enter>',   { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-n>', ':Gitsigns next_hunk <enter>',    { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-p>', ':Gitsigns prev_hunk <enter>',    { noremap = true })
      require'gitsigns'.setup {
        current_line_blame = true
      }
    end,
  },

}
