return {

  {
    'iruzo/nvmenu.nvim',
    version = '*',
    cmd = {'Nvmenu', 'NvmenuLua', 'NvmenuShell'},
    config = function()
      require'nvmenu'
    end
  },

}
