return {

  {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'VeryLazy',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      keymap = { preset = 'default' },
      cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }

}
