return {

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    cmd = 'Telescope',
    dependencies = {
      {'nvim-lua/plenary.nvim', version = '*' },
      'debugloop/telescope-undo.nvim',
      { 'nvim-telescope/telescope-live-grep-args.nvim', version = '*' },
    },
    keys = {
      { '<leader>d',  ':Telescope diagnostics<CR>',                                               silent = true, desc = 'telescope diagnostics' },
      { '<leader>u',  ':Telescope undo<CR>',                                                      silent = true, desc = 'telescope undo' },
      { '<leader>m',  ':Telescope man_pages<CR>',                                                 silent = true, desc = 'telescope man pages' },
      { '<leader>t',  ':Telescope colorscheme<CR>',                                               silent = true, desc = 'telescope colorscheme' },

      { '<leader>ff', ':Telescope git_files<CR>',                                                 silent = true, desc = 'telescope find git files' },
      { '<leader>fg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', silent = true, desc = 'telescope live grep' },
      { '<leader>fa', ':Telescope find_files<CR>',                                                silent = true, desc = 'telescope find files' },
      { '<leader>fb', ':Telescope buffers<CR>',                                                   silent = true, desc = 'telescope buffers' },

      { '<leader>gg', ':Telescope git_commits<CR>',                                               silent = true, desc = 'telescope git commits' },
      { '<leader>gf', ':Telescope git_bcommits<CR>',                                              silent = true, desc = 'telescope git bcommits' },
      { '<leader>gb', ':Telescope git_branches<CR>',                                              silent = true, desc = 'telescope git branches' },
      { '<leader>gs', ':Telescope git_status<CR>',                                                silent = true, desc = 'telescope git status' },
    },
    config = function()
      require'telescope'.setup {
        -- defaults = {
        --   file_ignore_patterns = {
        --     -- linux
        --     '.git/', '.cache/', '.local/', 'venv/', 'svn/', 'target/',
        --     -- windows
        --     '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\', 'target\\'
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
      require'telescope'.load_extension("undo")
    end
  },

}
