return {

  {
    'dstein64/vim-startuptime',
    tag = 'v4.4.0',
    cmd = 'StartupTime',
  },

  {
    'nvim-lua/plenary.nvim',
    tag = 'v0.1.3',
  },

  {
    'folke/which-key.nvim',
    tag = 'stable',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
      require('which-key').setup()
    end
  },

  {
    'folke/noice.nvim',
    tag = 'stable',
    event = 'VeryLazy',
    dependencies = {
      { 'MunifTanjim/nui.nvim', tag = '0.1.0', },
      { 'rcarriga/nvim-notify', tag = 'v3.12.0', }
    },
    opts = {
      cmdline = {
        view = 'cmdline',
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    }
  },

  {
    'jamessan/vim-gnupg',
    tag = 'v2.7.1',
    ft = { 'gpg', 'pgp', 'asc' },
    config = function()
      vim.g.GPGPreferSymmetric=1
    end
  },

  {
    'echasnovski/mini.comment',
    tag = 'v0.9.0',
    event = 'VeryLazy',
    config = function()
      require('mini.comment').setup()
    end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    tag = '2.69',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'MunifTanjim/nui.nvim', tag = '0.1.0', },
    },
    cmd = 'Neotree',
    keys = {
      { '<space>e', ':Neotree toggle=true position=right<CR>', silent = true, desc = 'File Explorer' },
    },
    config = function()
      require('neo-tree').setup()
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = 'Telescope',
    keys = {
      { '<space>h', ':Telescope live_grep<CR>', silent = true, desc = 'telescope live grep' },
      { '<space>f', ':Telescope find_files<CR>', silent = true, desc = 'telescope find files' },
      { '<space>t', ':Telescope diagnostics<CR>', silent = true, desc = 'telescope diagnostics' },
      { '<space>g', ':Telescope git_commits<CR>', silent = true, desc = 'telescope git commits' },
      { '<space>c', ':Telescope git_bcommits<CR>', silent = true, desc = 'telescope git bcommits' },
      { '<space>b', ':Telescope git_branches<CR>', silent = true, desc = 'telescope git branches' },
      { '<space>s', ':Telescope git_status<CR>', silent = true, desc = 'telescope git status' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            -- linux
            '.git/', '.cache/', '.local/', 'venv/', 'svn/', 'target/',
            -- windows
            '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\', 'target\\'
          },
        },
        pickers = {
          find_files = { hidden = 'true', theme = 'ivy', },
          buffers = { theme = 'ivy', },
          live_grep = { theme = 'ivy', },
          diagnostic = { theme = 'ivy', },
          git_commits = { theme = 'ivy', },
          git_bcommits = { theme = 'ivy', },
          git_branches = { theme = 'ivy', },
          git_status = { theme = 'ivy', },
        }
      }
    end
  },

  {
    'sanfusu/neovim-undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { 'U', ':UndotreeToggle<CR>', silent = true, desc = 'UndoTree' },
    },
  },

  {
    'luisiacc/gruvbox-baby',
    tag = '0.1.8',
    priority = 1000,
    config = function()
      vim.api.nvim_command 'colorscheme gruvbox-baby'
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup()
    end
  },

  {
    'nanozuki/tabby.nvim',
    tag = 'v2.1.5',
    keys = {
      { '<C-h>', ':tabprevious<CR>', silent = true, desc = 'tab previous' },
      { '<C-j>', ':tabnew<CR>', silent = true, desc = 'tab new' },
      { '<C-k>', ':tabclose<CR>', silent = true, desc = 'tab close' },
      { '<C-l>', ':tabnext<CR>', silent = true, desc = 'tab next' },
    },
    config = function()
      require('tabby.tabline').use_preset('active_wins_at_tail', {
        theme = {
          fill = 'TabLineFill', -- tabline background
          head = 'TabLine', -- head element highlight
          current_tab = 'TabLineSel', -- current tab label highlight
          tab = 'TabLine', -- other tab label highlight
          win = 'TabLine', -- window highlight
          tail = 'TabLine', -- tail element highlight
        },
        nerdfont = true, -- whether use nerdfont
        buf_name = {
          mode = '"unique"|"relative"|"tail"|"shorten"',
        },
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.0',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'TSUpdateSync',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = { enable = true, use_languagetree = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ColorizerToggle' },
    config = function() require('colorizer').setup() end,
  },

  {
    'iamcco/markdown-preview.nvim',
    tag = 'v0.0.10',
    ft = 'markdown',
    build = ':call mkdp#util#install()',
  },

  { 'TimUntersberger/neogit', cmd = 'Neogit' }, -- git menu

  {
    'lewis6991/gitsigns.nvim',
    tag = 'v0.6',
    event = 'VeryLazy',
    config = function()
      if vim.fn.isdirectory '.git' ~= 0 then
        vim.api.nvim_set_keymap('n', '<C-g>', ':Gitsigns preview_hunk <enter>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<C-r>', ':Gitsigns reset_hunk <enter>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<C-n>', ':Gitsigns next_hunk <enter>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<C-p>', ':Gitsigns prev_hunk <enter>', { noremap = true })
        require('gitsigns').setup {
          current_line_blame = true
        }
      end
    end,
  },

  {
    'mfussenegger/nvim-dap',
    tag = '0.6.0',
    cmd = 'DapToggleBreakpoint',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      { 'rcarriga/nvim-dap-ui', config = function() require'dapui'.setup() end },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
        },
      },
    },
    keys = {
      { '<F1>', ':DapToggleBreakpoint<CR>', silent = true, desc = 'dap toggle breakpoint' },
      { '<F2>', ':lua require"dap".step_over()<CR>', silent = true, desc = 'dap step over' },
      { '<F3>', ':lua require"dap".step_back()<CR>', silent = true, desc = 'dap step back' },
      { '<F4>', ':lua require"dap".step_into()<CR>', silent = true, desc = 'dap step into' },
      { '<F5>', ':lua require"dap".step_out()<CR>', silent = true, desc = 'dap step out' },
      { '<F6>', ':lua require"dap".continue()<CR>', silent = true, desc = 'dap continue' },
      { '<F7>', ':lua require"dap".terminate()<CR>', silent = true, desc = 'dap terminate' },
      { '<F9>', ':lua require"dapui".toggle()<CR>', silent = true, desc = 'dap toggle ui' },
    },
  },

  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = 'DBUI',
    dependencies = {
      {
        'tpope/vim-dadbod',
        config = function()
          vim.g.db_ui_save_location = '~/.local/data/nvim/dbui'
          vim.api.nvim_set_keymap('n', 'W', '<Plug>(DBUI_SaveQuery)', { noremap = true })
        end,
        dependencies = {
          { 'kristijanhusak/vim-dadbod-completion', after = 'vim-dadbod' },
        }
      }
    }
  },

--ai
-- 'github/copilot.vim'
-- { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp', }
-- { 'tzachar/cmp-tabnine', build = 'powershell ./install.ps1', dependencies = 'hrsh7th/nvim-cmp', }
-- { 'codota/tabnine-nvim', build = './dl_binaries.sh' },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
      })
    end
  },


  {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.6',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        tag = 'v1.5.0',
        build = ':MasonUpdate',
        dependencies = {
          {
            'williamboman/mason-lspconfig.nvim',
            tag = 'stable',
            cmd = { "LspInstall", "LspUninstall" },
            config = function()
              require'mason-lspconfig'.setup({ automatic_installation = true })
            end
          },
        },
        config = function()
          require'mason'.setup()
        end
      },
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-nvim-lua',
          'saadparwaiz1/cmp_luasnip',
        },
      },
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      vim.api.nvim_set_keymap('n', 'mm', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'rr', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true }) --open code actions using the default lsp UI
      vim.api.nvim_set_keymap('x', '<space>a', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true }) --open code actions for the selected visual range
      vim.api.nvim_set_keymap('n', '<M-p>', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<M-n>', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true })
      local cmp = require('cmp')
      require'cmp'.setup {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lua' },
          { name = 'path' },
          { name = 'buffer' },
        },
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        exmperimental = { ghost_text = true },
      }

      -- local f=io.open('Cargo.toml','r')
      -- if f~=nil then io.close(f)
      -- if string.find(vim.api.nvim_buf_get_name(0), ".rs") then
      --   require'lspconfig'.rust_analyzer.setup{}
      -- end
      if string.find(vim.api.nvim_buf_get_name(0), ".py") then
        require'lspconfig'.pylsp.setup{}
      end

    end
  },

  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    ft = 'rust',
    pin = true,
    config = function()
      local f=io.open('Cargo.toml','r')
      if f~=nil then io.close(f)
        local rt = require('rust-tools')
        rt.setup({
          server = {
            on_attach = function(_, bufnr)
              -- Hover actions
              vim.keymap.set('n', '<space>a', rt.hover_actions.hover_actions, { buffer = bufnr })
            end,
          },
        })
      end
    end,
  },

}