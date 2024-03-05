return {

  {
    'NTBBloodbath/doom-one.nvim',
    version = '*',
    priority = 1000,
    config = function()
      vim.g.doom_one_cursor_coloring         = true
      vim.g.doom_one_terminal_colors         = true
      vim.g.doom_one_italic_comments         = true
      vim.g.doom_one_enable_treesitter       = true
      vim.g.doom_one_diagnostics_text_color  = true
      vim.g.doom_one_transparent_background  = false

      vim.g.doom_one_plugin_neorg            = true
      vim.g.doom_one_plugin_barbar           = false
      vim.g.doom_one_plugin_telescope        = true
      vim.g.doom_one_plugin_neogit           = true
      vim.g.doom_one_plugin_nvim_tree        = true
      vim.g.doom_one_plugin_dashboard        = false
      vim.g.doom_one_plugin_startify         = false
      vim.g.doom_one_plugin_whichkey         = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate   = false
      vim.g.doom_one_plugin_lspsaga          = false

      vim.cmd.colorscheme 'doom-one'
    end
  },

  -- {
  --   'catppuccin/nvim',
  --   tag = 'stable',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require'catppuccin'.setup({
  --       -- transparent_background = not vim.g.neovide,
  --       background = { -- :h background
  --         light = "latte",
  --         dark = "macchiato",
  --       },
  --       term_colors = true,
  --       integrations = {
  --         telescope = true,
  --         mason = true,
  --         notify = true,
  --         -- harpoon = true,
  --         -- neotest = true,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = "",
  --         },
  --       },
  --     })
  --     vim.cmd.colorscheme 'catppuccin'
  --   end
  -- },

}
