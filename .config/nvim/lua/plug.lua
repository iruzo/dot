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
    'echasnovski/mini.align',
    tag = 'v0.9.0',
    event = 'VeryLazy',
    config = function()
      require'mini.align'.setup()
    end
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<spacel>r", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
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
    dependencies = {
      'debugloop/telescope-undo.nvim',
    },
    keys = {
      { '<space>h', ':Telescope live_grep<CR>', silent = true, desc = 'telescope live grep' },
      { '<space>f', ':Telescope find_files<CR>', silent = true, desc = 'telescope find files' },
      { '<space>t', ':Telescope diagnostics<CR>', silent = true, desc = 'telescope diagnostics' },
      { '<space>g', ':Telescope git_commits<CR>', silent = true, desc = 'telescope git commits' },
      { '<space>c', ':Telescope git_bcommits<CR>', silent = true, desc = 'telescope git bcommits' },
      { '<space>b', ':Telescope git_branches<CR>', silent = true, desc = 'telescope git branches' },
      { '<space>s', ':Telescope git_status<CR>', silent = true, desc = 'telescope git status' },
      { '<space>u', ':Telescope undo<CR>', silent = true, desc = 'telescope undo' },
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
          find_files = { hidden = 'true' },
        }
      }
      require("telescope").load_extension("undo")
    end
  },

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require'onedark'.load()
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.7',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.opt.termguicolors = true
      vim.opt.list = true
      vim.opt.listchars:append "eol:↴"

      require("indent_blankline").setup {
          show_end_of_line = true,
      }
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        -- options = { theme = 'onedark' }
      }
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
    'echasnovski/mini.hipatterns',
    tag = 'v0.9.0',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
          todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
          note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end
  },

  {
    'iamcco/markdown-preview.nvim',
    tag = 'v0.0.10',
    ft = 'markdown',
    build = ':call mkdp#util#install()',
  },

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit'
  },

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
    'pwntester/octo.nvim',
    cmd = 'Octo',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require'octo'.setup()
    end
  },

  {
    'mfussenegger/nvim-dap',
    tag = '0.6.0',
    cmd = 'DapToggleBreakpoint',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      { 'rcarriga/nvim-dap-ui', config = function() require'dapui'.setup() end },
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = 'mason.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
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

  -- -- ai
  -- 'github/copilot.vim'
  -- { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'tzachar/cmp-tabnine', build = 'powershell ./install.ps1', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'codota/tabnine-nvim', build = './dl_binaries.sh' },

  {
    'WhiteBlackGoose/gpt4all.nvim',
    cmd = {
      'ChatGPT',
      'ChatGPTActAs',
      'ChatGPTCompleteCode',
      'ChatGPTEditWithInstructions',
      'ChatGPTRun',
    },
    config = function()
      require'chatgpt'.setup()
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
  },

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
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        tag = 'stable',
        cmd = { 'LspInstall', 'LspUninstall' },
        dependencies = {
          {
            'williamboman/mason.nvim',
            tag = 'v1.5.0',
            build = ':MasonUpdate',
            config = function()
              require'mason'.setup()
            end
          },
        },
        config = function()
          require'mason-lspconfig'.setup({
            -- automatic_installation = true,
            handlers = {
              function (server_name)
                  require("lspconfig")[server_name].setup {
                    capabilities = require'cmp_nvim_lsp'.default_capabilities()
                  }
              end,
            },
          })
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
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-nvim-lua',
          {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
              {
                'L3MON4D3/LuaSnip',
                tag = 'v1.2.1',
                dependencies = {
                  'rafamadriz/friendly-snippets',
                },
              }
            }
          },
        },
        config = function(args)
          local cmp = require('cmp')
          require'cmp'.setup {
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
              { name = 'nvim_lua' },
              { name = 'path' },
            }, {
              { name = 'buffer' },
            }),
            snippet = {
              expand = function(args)
                require'luasnip'.lsp_expand(args.body)
              end
            },
            mapping = cmp.mapping.preset.insert({
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
              ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
            }),
            exmperimental = { ghost_text = true },
          }
        end
      },
    },
    config = function()
      vim.api.nvim_set_keymap('n', 'mm', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', 'rr', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('x', '<space>a', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<M-p>', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<M-n>', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true })
    end
  },

}
