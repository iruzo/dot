return {

  {
    'ahmedkhalf/project.nvim',
    config = function()
      require'project_nvim'.setup {
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", ".svn", "README.md", "*.sln" },
        -- detection_methods = { "lsp", "pattern" },
        -- patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        ignore_lsp = {}, -- eg: { "efm", ... }
        exclude_dirs = {}, -- Ex: { "~/.cargo/*", ... }
        show_hidden = false, -- Show hidden files in telescope
        silent_chdir = false, -- When set to false, you will get a message when project.nvim changes your directory
        scope_chdir = 'tab', -- What scope to change the directory, valid options are: global (default), tab, win
        datapath = vim.fn.stdpath("data"),
      }
    end

  },

}
