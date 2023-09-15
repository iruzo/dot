return {

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
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
    tag = 'v0.6',
    event = 'VeryLazy',
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
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cond = function()
      if vim.fn.isdirectory '.git' ~= 0 then
        return true
      end
    end,
    opts = true,
  },

}
