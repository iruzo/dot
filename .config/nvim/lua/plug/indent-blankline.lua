return {

  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v3.3.7',
    event = { 'BufReadPost', 'BufNewFile' },
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
