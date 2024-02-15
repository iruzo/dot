return {

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      { 'nvim-lua/plenary.nvim', version = '*' },         -- required
      { 'nvim-telescope/telescope.nvim', version = '*' }, -- optional
      'sindrets/diffview.nvim',                           -- optional
    },
    cond = function()
      if vim.fn.isdirectory '.git' ~= 0 then
        return true
      end
    end,
    opts = true;
  },

  {
    'lewis6991/gitsigns.nvim',
    version = '*',
    cond = function()
      if vim.fn.isdirectory '.git' ~= 0 then
        return true
      end
    end,
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

  {
    'pwntester/octo.nvim',
    cmd = 'Octo',
    dependencies = {
      { 'nvim-lua/plenary.nvim', version = '*' },
      { 'nvim-telescope/telescope.nvim', version = '*' },
      { 'nvim-tree/nvim-web-devicons', version = '*' },
    },
    cond = function()
      if vim.fn.isdirectory '.git' ~= 0 then
        return true
      end
    end,
    opts = true,
  },

}
