return {

  {
    'catppuccin/nvim',
    tag = 'stable',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require'catppuccin'.setup({
        flavour = 'frappe',
        -- transparent_background = true,
        color_overrides = {
          frappe = { -- custom
            rosewater = "#ffc6be",
            flamingo = "#f2594b",
            pink = "#d3869b",
            mauve = "#b16286",
            red = "#cc241d",
            maroon = "#d65d0e",
            peach = "#fe8019",
            yellow = "#fabd2f",
            green = "#b8bb26",
            teal = "#8bba7f",
            sky = "#83a598",
            sapphire = "#8ec07c",
            blue = "#83a598",
            lavender = "#e2cca9",
            text = "#e2cca9",
            subtext1 = "#e2cca9",
            subtext0 = "#e2cca9",
            overlay2 = "#928374",
            overlay1 = "#7c6f64",
            overlay0 = "#665c54",
            surface2 = "#504945",
            surface1 = "#3c3836",
            surface0 = "#32302f",
            base = "#282828",
            mantle = "#1d2021",
            crust = "#1b1b1b",
          },
        },
      })
      vim.cmd.colorscheme 'catppuccin'
    end
  },

}
