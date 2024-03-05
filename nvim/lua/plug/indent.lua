return {

  {
    'lukas-reineke/indent-blankline.nvim',
    version = '*',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.opt.termguicolors = true
      vim.opt.list = true
      vim.opt.listchars:append 'eol:·'

      -- local highlight = {
      --   "RainbowRed",
      --   "RainbowYellow",
      --   "RainbowBlue",
      --   "RainbowOrange",
      --   "RainbowGreen",
      --   "RainbowViolet",
      --   "RainbowCyan",
      -- }

      -- local hooks = require "ibl.hooks"
      -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      --   vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#f38ba8" })
      --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
      --   vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#89b4fa" })
      --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
      --   vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#a6e3a1" })
      --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
      --   vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#89dceb" })
      -- end)

      require'ibl'.setup {
        indent = { highlight = highlight },
        scope = { highlight = highlight },
      }
    end
  },

  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = true
  }

}
