return {

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      {
        'echasnovski/mini.icons',
        version = false,
        opts = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
      }
    },
    opts = {
      pipe_table = {
        enabled = false,
      },
    },
  },

  {
    'iamcco/markdown-preview.nvim', -- Error on NixOS when using prebuilt binary: https://github.com/iamcco/markdown-preview.nvim/issues/366
    version = '*',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = 'markdown',
    build = ':call mkdp#util#install()',
    config = function()
      vim.g.mkdp_page_title = ''
      vim.g.mkdp_theme = 'light'
      vim.g.mkdp_browser = 'chromium'
    end
  },

  {
    "ellisonleao/glow.nvim",
    version = '*',
    ft = 'markdown',
    config = function()
      require'glow'.setup({
        border = "rounded",
      })
    end
  }

}
