return {

  {
    'catppuccin/nvim',
    tag = 'stable',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require'catppuccin'.setup({
        -- transparent_background = not vim.g.neovide,
        flavour = 'auto',
        color_overrides = {
          mocha = { -- onedark
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#c678dd",
            red = "#e06c75",
            maroon = "#eba0ac",
            peach = "#d19a66",
            yellow = "#e5c07b",
            green = "#98c379",
            teal = "#94e2d5",
            sky = "#56b5c2",
            sapphire = "#74c7ec",
            blue = "#61afef",
            lavender = "#b4befe",
            text = "#abb2bf",
            subtext1 = "#dfdfdf",
            subtext0 = "#9ca0a4",
            overlay2 = "#73797e",
            overlay1 = "#5b6268",
            overlay0 = "#3f444a",
            surface2 = "#393f4a",
            surface1 = "#31353f",
            surface0 = "#31353f",
            base = "#282c34",
            mantle = "#21252b",
            crust = "#181a1f",
          }
        },
        styles = {
          comments = { 'bold' },
          keywords = { 'bold' },
        },
      })
      vim.cmd.colorscheme 'catppuccin'
    end
  }

}
