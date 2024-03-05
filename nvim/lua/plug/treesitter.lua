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
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    config = function()
      require'nvim-treesitter'.setup {
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
      vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, { -- https://github.com/nvim-treesitter/nvim-treesitter/issues/2916
        pattern = "*.md",
        callback = function()
          local line_count = vim.api.nvim_buf_line_count(0)
          if line_count > 1000 then
            vim.cmd("TSBufDisable highlight")
          end
        end,
      })
      vim.api.nvim_create_autocmd("TextChanged", { -- https://github.com/nvim-treesitter/nvim-treesitter/issues/2916
        pattern = "*.md",
        callback = function()
          pcall(vim.cmd, "TSBufToggle highlight")
          pcall(vim.cmd, "TSBufToggle highlight")
        end,
      })
    end
  },

}
