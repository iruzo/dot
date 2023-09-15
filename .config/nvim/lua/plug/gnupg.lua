return {

  {
    'jamessan/vim-gnupg',
    tag = 'v2.7.1',
    ft = { 'gpg', 'pgp', 'asc' },
    config = function()
      vim.g.GPGPreferSymmetric=1
    end
  },

}
