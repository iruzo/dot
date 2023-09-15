return {

  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.7',
    event = { 'BufReadPost', 'BufNewFile' },
    event = 'VeryLazy',
    config = function()
      vim.opt.termguicolors = true
      vim.opt.list = true
      vim.opt.listchars:append "eol:↴"

      require'indent_blankline'.setup {
        show_end_of_line = true,
      }
    end
  },

}
