return {

  {
    'iamcco/markdown-preview.nvim', -- Error on NixOS when using prebuilt binary: https://github.com/iamcco/markdown-preview.nvim/issues/366
    version = '*',
    ft = 'markdown',
    build = ':call mkdp#util#install()',
  },

}
