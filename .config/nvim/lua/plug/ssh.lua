return {

  {
    'NOSDuco/remote-sshfs.nvim',
    tag = 'v0.2.3',
    dependencies = {
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4', },
    },
    cmd = 'RemoteSSHFSConnect',
    keys = {
      { '<leader>fs', ':RemoteSSHFSConnect<CR>', silent = true, desc = 'ssh open connection' },
    },
    opts = true,
  },

}
