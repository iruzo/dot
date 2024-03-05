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
      vim.g.mkdp_preview_options = {
        disable_filename = 1,
      }
      if vim.fn.executable("chromium") == 1  then
        vim.g.mkdp_browser = 'chromium'
      end
      if vim.fn.executable("chromium-browser") == 1  then
        vim.g.mkdp_browser = 'chromium-browser'
      end
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown.css")
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
