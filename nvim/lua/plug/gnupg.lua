return {

  {
    'jamessan/vim-gnupg',
    version = '*',
    ft = { 'gpg', 'pgp', 'asc' },
    config = function()
      vim.g.GPGPreferSymmetric=1
    end
  },

}
