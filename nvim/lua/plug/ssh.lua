return {

  {
    'NOSDuco/remote-sshfs.nvim',
    version = '*',
    dependencies = {
      { 'nvim-telescope/telescope.nvim', version = '*' },
    },
    cmd = 'RemoteSSHFSConnect',
    keys = {
      { '<leader>fs', ':RemoteSSHFSConnect<CR>', silent = true, desc = 'ssh open connection' },
    },
    opts = true,
  },

}
