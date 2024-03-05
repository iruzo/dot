return {

  {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-context', version = '*' },
      'RRethy/nvim-treesitter-endwise',
      {
        'windwp/nvim-ts-autotag',
        main = "nvim-ts-autotag",
        opts = {},
      },
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'TSUpdateSync',
    cond = function() -- keep this condition until this is closed: https://github.com/nvim-treesitter/nvim-treesitter/issues/2916
      if not string.find(vim.fn.expand('%'), '.md') then
        return true
      end
    end,
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        auto_tag = { enable = true, },
        endwise = { enable = true, },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end
  },

}
