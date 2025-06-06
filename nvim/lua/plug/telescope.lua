return {

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    cmd = 'Telescope',
    dependencies = {
      {'nvim-lua/plenary.nvim', version = '*' },
      'nvim-tree/nvim-web-devicons',
      'debugloop/telescope-undo.nvim',
      { 'nvim-telescope/telescope-live-grep-args.nvim', version = '*' },
    },
    keys = {
      { '<leader>/',  ':Telescope current_buffer_fuzzy_find<CR>',                                 silent = true, desc = 'telescope buffer find' },

      { '<leader>d',  ':Telescope diagnostics<CR>',                                               silent = true, desc = 'telescope diagnostics' },
      { '<leader>u',  ':Telescope undo<CR>',                                                      silent = true, desc = 'telescope undo' },
      { '<leader>m',  ':Telescope man_pages<CR>',                                                 silent = true, desc = 'telescope man pages' },
      { '<leader>c',  ':Telescope colorscheme<CR>',                                               silent = true, desc = 'telescope colorscheme' },
      { '<leader>h',  ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', silent = true, desc = 'telescope live grep' },

      { '<leader>b',  ':Telescope buffers<CR>',                                                   silent = true, desc = 'telescope buffers' },
      { '<leader>ff', ':Telescope git_files<CR>',                                                 silent = true, desc = 'telescope find git files' },
      { '<leader>fa', ':Telescope find_files<CR>',                                                silent = true, desc = 'telescope find files' },
      { '<leader>fp', ':Telescope projects<CR>',                                                  silent = true, desc = 'telescope projects' },

      { '<leader>gg', ':Telescope git_commits<CR>',                                               silent = true, desc = 'telescope git commits' },
      { '<leader>gf', ':Telescope git_bcommits<CR>',                                              silent = true, desc = 'telescope git bcommits' },
      { '<leader>gb', ':Telescope git_branches<CR>',                                              silent = true, desc = 'telescope git branches' },
      { '<leader>gs', ':Telescope git_status<CR>',                                                silent = true, desc = 'telescope git status' },
    },
    config = function()
      telescope = require'telescope'
      telescope.setup {
        -- defaults = {
        --   file_ignore_patterns = {
        --     -- linux
        --     '.git/', '.cache/', '.local/', 'venv/', 'svn/', 'target/',
        --     -- windows
        --     '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\', 'target\\'
        --   },
        --   vimgrep_arguments = {
        --
        --   },
        -- },
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
      telescope.load_extension('undo')
      telescope.load_extension('projects')
    end
  },

}
