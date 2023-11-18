return {

  {
    'nanozuki/tabby.nvim',
    tag = 'v2.3.0',
    keys = {
      { '<C-h>', ':tabprevious<CR>', silent = true, desc = 'tab previous' },
      { '<C-j>', ':tabnew<CR>', silent = true, desc = 'tab new' },
      { '<C-k>', ':tabclose<CR>', silent = true, desc = 'tab close' },
      { '<C-l>', ':tabnext<CR>', silent = true, desc = 'tab next' },
    },
    config = function()
      require'tabby.tabline'.use_preset('active_wins_at_tail', {
        theme = {
          fill = 'TabLineFill',       -- tabline background
          head = 'TabLine',           -- head element highlight
          current_tab = 'TabLineSel', -- current tab label highlight
          tab = 'TabLine',            -- other tab label highlight
          win = 'TabLine',            -- window highlight
          tail = 'TabLine',           -- tail element highlight
        },
        nerdfont = true,              -- whether use nerdfont
        buf_name = {
          mode = '"unique"|"relative"|"tail"|"shorten"',
        },
      })
    end
  },

}
