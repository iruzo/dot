return {

  {
    'iamcco/markdown-preview.nvim', -- Error on NixOS when using prebuilt binary: https://github.com/iamcco/markdown-preview.nvim/issues/366
    version = '*',
    ft = 'markdown',
    build = ':call mkdp#util#install()',
  },

  {
    "ellisonleao/glow.nvim",
    version = '*',
    ft = 'markdown',
    config = function()
      require'glow'.setup({
        border = "rounded",
      })
    end
  }

}
