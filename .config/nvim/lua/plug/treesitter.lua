return {

  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.1',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
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
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        auto_tag = { enable = true, },
        endwise = { enable = true, },
        highlight = { enable = true, use_languagetree = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      }
    end
  },

}
