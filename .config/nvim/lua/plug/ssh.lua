return {

  {
    'NOSDuco/remote-sshfs.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    cmd = 'RemoteSSHFSConnect',
    keys = {
      { '<leader>fs', ':RemoteSSHFSConnect<CR>', silent = true, desc = 'ssh open connection' },
    },
    opts = true,
  },

}
