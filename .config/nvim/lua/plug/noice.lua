return {

  {
    'folke/noice.nvim',
    tag = 'stable',
    event = 'VeryLazy',
    dependencies = {
      { 'MunifTanjim/nui.nvim', version = '*' },
      { 'rcarriga/nvim-notify', version = '*' }
    },
    opts = {
      cmdline = {
        view = 'cmdline',
      },
      notify = {
        view = 'mini',
      },
      messages = {
        view = 'mini',
        view_error = "mini",         -- view for errors
        view_warn = "mini",          -- view for warnings
        view_history = "messages",   -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    }
  },

}
