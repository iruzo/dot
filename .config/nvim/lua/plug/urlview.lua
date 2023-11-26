return {

  {
    'axieax/urlview.nvim',
    cmd = 'UrlView',
    opts = true,
    dependencies = {
      {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
      },
    },
    config = function()
      require("urlview").setup({
        default_picker = "telescope",
      })
    end
  },

}
