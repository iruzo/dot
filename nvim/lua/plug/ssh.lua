return {

  {
    'NOSDuco/remote-sshfs.nvim',
    version = '*',
    cmd = 'RemoteSSHFSConnect',
    keys = {
      { '<leader>fs', ':RemoteSSHFSConnect<CR>', silent = true, desc = 'ssh open connection' },
    },
    opts = true,
  },

}
