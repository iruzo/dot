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
          -- mocha = { -- gruvbox
          --   rosewater = "#ffc6be",
          --   flamingo = "#fb4934",
          --   pink = "#ff75a0",
          --   mauve = "#f2594b",
          --   red = "#f2594b",
          --   maroon = "#fe8019",
          --   peach = "#FFAD7D",
          --   yellow = "#e9b143",
          --   green = "#b0b846",
          --   teal = "#8bba7f",
          --   sky = "#7daea3",
          --   sapphire = "#689d6a",
          --   blue = "#80aa9e",
          --   lavender = "#e2cca9",
          --   text = "#e2cca9",
          --   subtext1 = "#e2cca9",
          --   subtext0 = "#e2cca9",
          --   overlay2 = "#8C7A58",
          --   overlay1 = "#735F3F",
          --   overlay0 = "#806234",
          --   surface2 = "#665c54",
          --   surface1 = "#3c3836",
          --   surface0 = "#32302f",
          --   base = "#282828",
          --   mantle = "#1d2021",
          --   crust = "#1b1b1b",
          -- }
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