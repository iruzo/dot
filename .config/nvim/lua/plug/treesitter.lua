return {

  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.1',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'TSUpdateSync',
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        highlight = { enable = true, use_languagetree = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      }
    end
  },

}
