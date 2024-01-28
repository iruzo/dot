return {

  {
    'jamessan/vim-gnupg',
    ft = { 'gpg', 'pgp', 'asc' },
    config = function()
      vim.g.GPGPreferSymmetric=1
    end
  },

}
