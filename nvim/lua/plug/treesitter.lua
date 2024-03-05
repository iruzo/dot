return {

  {
    'nvim-treesitter/nvim-treesitter',
    -- version = '*', -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
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
    event = { 'VeryLazy' },
    cmd = 'TSUpdateSync',
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        auto_tag = { enable = true, },
        endwise = { enable = true, },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf) -- https://github.com/nvim-treesitter/nvim-treesitter/issues/2916
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                  return true
              end
          end,
        },
        indent = { enable = true },
      }
    end
  },

}
