return {

  {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'VeryLazy',
    dependencies = {
      {'L3MON4D3/LuaSnip', version = 'v2.*', run = 'make install_jsregexp'},
      'rafamadriz/friendly-snippets',
      'iruzo/snip',
    },
    opts = {
      keymap = {
        preset = 'default',
        -- ['<CR>'] = { 'select_and_accept', 'fallback' },
      },
      cmdline = {
        keymap = { preset = 'default' }, -- inherit
        completion = { menu = { auto_show = true } },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        documentation = { auto_show = false }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      snippets = {
        preset = 'luasnip',
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup({})
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = {
          vim.fn.stdpath("data") .. "/lazy/snip",
        },
      })
      require("blink.cmp").setup(opts)
    end,
  }

}
