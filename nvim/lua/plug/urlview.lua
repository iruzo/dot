return {

  {
    'axieax/urlview.nvim',
    cmd = 'UrlView',
    opts = true,
    config = function()
      require("urlview").setup({
        default_picker = "telescope",
      })
    end
  },

}
