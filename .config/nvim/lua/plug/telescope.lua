return {

 {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    keys = {
      { '<space>h', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', silent = true, desc = 'telescope live grep' },
      { '<space>f', ':Telescope find_files<CR>',                                                silent = true, desc = 'telescope find files' },
      { '<space>F', ':Telescope buffers<CR>',                                                   silent = true, desc = 'telescope buffers' },
      { '<space>t', ':Telescope diagnostics<CR>',                                               silent = true, desc = 'telescope diagnostics' },
      { '<space>g', ':Telescope git_commits<CR>',                                               silent = true, desc = 'telescope git commits' },
      { '<space>c', ':Telescope git_bcommits<CR>',                                              silent = true, desc = 'telescope git bcommits' },
      { '<space>b', ':Telescope git_branches<CR>',                                              silent = true, desc = 'telescope git branches' },
      { '<space>s', ':Telescope git_status<CR>',                                                silent = true, desc = 'telescope git status' },
      { '<space>u', ':Telescope undo<CR>',                                                      silent = true, desc = 'telescope undo' },
    },
    config = function()
      require'telescope'.setup {
        defaults = {
          file_ignore_patterns = {
            -- linux
            '.git/', '.cache/', '.local/', 'venv/', 'svn/', 'target/',
            -- windows
            '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\', 'target\\'
          },
        },
        pickers = {
          find_files = { hidden = 'true' },
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = "delete_buffer",
              }
            }
          }
        }
      }
      require'telescope'.load_extension("undo")
    end
  },

}
