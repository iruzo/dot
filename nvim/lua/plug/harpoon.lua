return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  keys = {
    { '<leader>a', ':lua require("harpoon"):list():add()<CR>',                                    silent = true, desc = 'harpoon' },
    { '<leader>p', ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>', silent = true, desc = 'harpoon' },
    { '<leader>1', ':lua require("harpoon"):list():select(1)<CR>',                                silent = true, desc = 'harpoon' },
    { '<leader>2', ':lua require("harpoon"):list():select(2)<CR>',                                silent = true, desc = 'harpoon' },
    { '<leader>3', ':lua require("harpoon"):list():select(3)<CR>',                                silent = true, desc = 'harpoon' },
    { '<leader>4', ':lua require("harpoon"):list():select(4)<CR>',                                silent = true, desc = 'harpoon' },
    { '<leader>5', ':lua require("harpoon"):list():select(5)<CR>',                                silent = true, desc = 'harpoon' },
    { '<leader><leader>1', ':lua require("harpoon_term").goto_terminal(1)<CR>',                   silent = true, desc = 'harpoon' },
    { '<leader><leader>2', ':lua require("harpoon_term").goto_terminal(2)<CR>',                   silent = true, desc = 'harpoon' },
    { '<leader><leader>3', ':lua require("harpoon_term").goto_terminal(3)<CR>',                   silent = true, desc = 'harpoon' },
    { '<leader><leader>4', ':lua require("harpoon_term").goto_terminal(4)<CR>',                   silent = true, desc = 'harpoon' },
    { '<leader><leader>5', ':lua require("harpoon_term").goto_terminal(5)<CR>',                   silent = true, desc = 'harpoon' },
  },
  dependencies = {
    { 'davvid/harpoon-term.nvim', opts = {} },
    { 'nvim-lua/plenary.nvim', version = '*' },
    { 'nvim-telescope/telescope.nvim', version = '*' },
  },
  opts = {},
}
