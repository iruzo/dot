return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      { '<leader>a', ':lua require("harpoon"):list():append()<CR>',                                 silent = true, desc = 'harpoon' },
      { '<leader>p', ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>', silent = true, desc = 'harpoon' },
      { '<leader>1', ':lua require("harpoon"):list():select(1)<CR>',                                silent = true, desc = 'harpoon' },
      { '<leader>2', ':lua require("harpoon"):list():select(2)<CR>',                                silent = true, desc = 'harpoon' },
      { '<leader>3', ':lua require("harpoon"):list():select(3)<CR>',                                silent = true, desc = 'harpoon' },
      { '<leader>4', ':lua require("harpoon"):list():select(4)<CR>',                                silent = true, desc = 'harpoon' },
      { '<leader>5', ':lua require("harpoon"):list():select(5)<CR>',                                silent = true, desc = 'harpoon' },
    },
    config = function()
      require("harpoon"):setup()
    end
}
