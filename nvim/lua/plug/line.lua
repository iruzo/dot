return {

  {
    'nvim-lualine/lualine.nvim',
    version = '*',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', version = '*' }
    },
    event = 'VeryLazy',
    opts = true,
    config = function()
      require'lualine'.setup ({
        options = {
          component_separators = { left = ' ', right = ' '},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'fileformat', 'hostname', 'encoding', 'filetype', 'filename', 'filesize'},
          lualine_x = {'selectioncount'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
    end
  },

}
