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
      { '<leader>/',  function() require('telescope.builtin').current_buffer_fuzzy_find() end,        silent = true, desc = 'telescope buffer find' },

      { '<leader>d',  function() require('telescope.builtin').diagnostics() end,                      silent = true, desc = 'telescope diagnostics' },
      { '<leader>u',  function() require('telescope').extensions.undo.undo() end,                     silent = true, desc = 'telescope undo' },
      { '<leader>m',  function() require('telescope.builtin').man_pages() end,                        silent = true, desc = 'telescope man pages' },
      { '<leader>c',  function() require('telescope.builtin').colorscheme() end,                      silent = true, desc = 'telescope colorscheme' },
      { '<leader>h',  function() require('telescope').extensions.live_grep_args.live_grep_args() end, silent = true, desc = 'telescope live grep' },

      { '<leader>b',  function() require('telescope.builtin').buffers() end,                          silent = true, desc = 'telescope buffers' },
      { '<leader>ff', function()
          if vim.fn.executable('rg') == 1 then
            require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--color', 'never', '--no-ignore' } })
          else
            require('telescope.builtin').find_files({ hidden = false })
          end
        end, silent = true, desc = 'telescope find files (no hidden)' },
      { '<leader>fa', function()
          if vim.fn.executable('rg') == 1 then
            require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--color', 'never', '--no-ignore', '--hidden' } })
          else
            require('telescope.builtin').find_files({ hidden = true })
          end
        end, silent = true, desc = 'telescope find files (with hidden)' },
      { '<leader>fp', function() require('telescope').extensions.projects.projects() end,             silent = true, desc = 'telescope projects' },

      { '<leader>gg', function() require('telescope.builtin').git_commits() end,                      silent = true, desc = 'telescope git commits' },
      { '<leader>gf', function() require('telescope.builtin').git_bcommits() end,                     silent = true, desc = 'telescope git bcommits' },
      { '<leader>gb', function() require('telescope.builtin').git_branches() end,                     silent = true, desc = 'telescope git branches' },
      { '<leader>gs', function() require('telescope.builtin').git_status() end,                       silent = true, desc = 'telescope git status' },

      -- lsp
      { 'gi',         function() require('telescope.builtin').lsp_implementations() end,              silent = true, desc = 'telescope LSP implementations', mode = 'n' },
      { 'gd',         function() require('telescope.builtin').lsp_definitions() end,                  silent = true, desc = 'telescope LSP definitions',     mode = 'n' },
      { 'gr',         function() require('telescope.builtin').lsp_references() end,                   silent = true, desc = 'telescope LSP references',      mode = 'n' },

    },
    config = function()
      actions = require'telescope.actions'
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
          find_files = {
            theme = "ivy",
            previewer = false,
          },
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
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
