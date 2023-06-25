return {
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- basic
  'lewis6991/impatient.nvim',
  'nvim-lua/plenary.nvim', --lua functions for addons

  -- general
  {
    'folke/which-key.nvim',
	  tag = 'stable',
    event = "BufRead",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
      require("which-key").setup()
    end
  },

  {
    'phaazon/hop.nvim',
    event = "BufRead",
    event = "VeryLazy",
    keys = {
      { "f", ":HopChar2<CR>", silent = true, desc = "Hop" },
    },
    config = function()
      require('hop').setup()
    end
  },

  {
    "jamessan/vim-gnupg",
    config = function()
      vim.g.GPGPreferSymmetric=1
    end
  },

  {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb" },
    config = function() require('Comment').setup() end
  },

  {
    'nvim-telescope/telescope.nvim',
	  tag = '0.1.1',
    config = function()
      vim.api.nvim_set_keymap('n', '<space>h', ':Telescope live_grep<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>f', ':Telescope buffers<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>F', ':Telescope find_files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>t', ':Telescope diagnostics<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>g', ':Telescope git_commits<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>c', ':Telescope git_bcommits<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>b', ':Telescope git_branches<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>s', ':Telescope git_status<CR>', { noremap = true })
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            -- linux
            '.git/', '.cache/', '.local/', 'venv/', 'svn/', 'target/',
            -- windows
            '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\', 'target\\'
          },
          vimgrep_arguments = {
              "grep",
              "--extended-regexp",
              "--color=never",
              "--with-filename",
              "--line-number",
              "-b", -- grep doesn't support a `--column` option :(
              "--ignore-case",
              "--recursive",
              "--no-messages",
              "--binary-files=without-match"
              -- git grep also works but limits to only git directories,the above works perfectly
              -- "git", "grep", "--full-name", "--line-number", "--column", "--extended-regexp", "--ignore-case",
              -- "--no-color", "--recursive", "--recurse-submodules", "-I"
          },
        },
        pickers = {
          find_files = {
            hidden = 'true',
            theme = "ivy",
          },
          buffers = {
            theme = "ivy",
          },
          live_grep = {
            theme = "ivy",
          },
          diagnostic = {
            theme = "ivy",
          },
          git_commits = {
            theme = "ivy",
          },
          git_bcommits = {
            theme = "ivy",
          },
          git_branches = {
            theme = "ivy",
          },
          git_status = {
            theme = "ivy",
          },
        }
      }
    end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    event = "VeryLazy",
    keys = {
      { "<space>e", ":NeoTreeRevealToggle<CR>", silent = true, desc = "File Explorer" },
    },
    config = function()
      require("neo-tree").setup()
    end
  },

  {
    'sanfusu/neovim-undotree',
    event = 'BufRead',
    config = function()
      vim.api.nvim_set_keymap('n', 'U', ':UndotreeToggle<CR>', { noremap = true })
    end
  },

  -- visual
  {
     "catppuccin/nvim",
     name = "catppuccin",
     config = function()
       require("catppuccin").setup {
         -- transparent_background = true,
         flavour = "mocha", -- mocha, macchiato, frappe, latte
         transparent_background = true,
         integrations = {
           hop = true,
           mason = true,
           neotree = true,
           which_key = true,
           dap = { enable = true, enable_ui = true }
         },
         color_overrides = {
           all = {
             rosewater = "#e96c75",
             flamingo = "#e96c75",
             -- pink
             mauve = "#c678dd",
             red = "#e96c75",
             -- maroon
             peach = "#d19a66",
             yellow = "#e5c07b",
             green = "#98c379",
             teal = "#56b6c2",
             -- sky
             -- sapphire
             blue = "#61afef",
             -- Lavender
             text = "#abb2bf",
             -- subtext1
             -- subtext0
             -- overlay2
             -- overlay1
             -- overlay0
             -- surface2
             -- surface1
             -- surface0
             base = "#282c34",
             mantle = "#282c34",
             crust = "#282c34",
           },
         },
       }
       vim.api.nvim_command "colorscheme catppuccin"
     end
  },

  -- { 'nvim-lualine/lualine.nvim', event = "BufRead", config = function() require("lualine").setup() end },

  {
    'nanozuki/tabby.nvim',
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-j>', ':tabnew<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-k>', ':tabclose<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true })
      require("tabby.tabline").use_preset("active_wins_at_tail", {
        theme = {
          fill = "TabLineFill", -- tabline background
          head = "TabLine", -- head element highlight
          current_tab = "TabLineSel", -- current tab label highlight
          tab = "TabLine", -- other tab label highlight
          win = "TabLine", -- window highlight
          tail = "TabLine", -- tail element highlight
        },
        nerdfont = true, -- whether use nerdfont
        buf_name = {
          mode = "'unique'|'relative'|'tail'|'shorten'",
        },
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    event = { 'BufRead', 'BufNewFile', 'InsertEnter' },
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        autoinstall = true,
        highlight = { enable = true, use_languagetree = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    -- event = "BufRead",
    cmd = { 'ColorizerToggle' },
    config = function() require("colorizer").setup() end,
  },

  {
    "folke/twilight.nvim",
    cmd = { 'Twilight' },
    opts = {
      dimming = {
        alpha = 0.30, -- amount of dimming
        color = { "Normal", "#282c34" },
        term_bg = "#282c34", -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
    }
  },

  {
    'ellisonleao/glow.nvim',
    cmd = { 'Glow' },
    config = true
  },

  { 'TimUntersberger/neogit', cmd = 'Neogit' }, -- git menu

  { -- show git changes in files
    'lewis6991/gitsigns.nvim',
    config = function()
      if vim.fn.isdirectory ".git" ~= 0 then
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
    event = "BufRead",
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      { 'rcarriga/nvim-dap-ui', config = function() require'dapui'.setup() end },
      {
        'jayp0521/mason-nvim-dap.nvim',
        config = function()
          vim.api.nvim_set_keymap('n', '<F1>', ':DapToggleBreakpoint<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F2>', ':lua require"dap".step_over()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F3>', ':lua require"dap".step_back()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F4>', ':lua require"dap".step_into()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".step_out()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F6>', ':lua require"dap".continue()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".terminate()<CR>', { noremap = true })
          vim.api.nvim_set_keymap('n', '<F9>', ':lua require"dapui".toggle()<CR>', { noremap = true })
          require'mason-nvim-dap'.setup({ automatic_setup = true })
          -- require'mason-nvim-dap'.setup_handlers {
          --   function(source_name)
          --     require('mason-nvim-dap.automatic_setup')(source_name)
          --   end,
          -- }
        end
      },
    }
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
  -- { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require("null-ls")
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
    'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

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

      local lsp = require("lsp-zero")
      lsp.preset("recommended")

      -- lsp.ensure_installed({
      --   'rust_analyzer'
      -- })

      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      })
      cmp.setup({experimental = { ghost_text = true }})

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
      end)

      lsp.setup()
    end
  },

  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    ft = "rust",
    pin = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local f=io.open("Cargo.toml","r")
      if f~=nil then io.close(f)
        local rt = require("rust-tools")
        rt.setup({
          server = {
            on_attach = function(_, bufnr)
              -- Hover actions
              vim.keymap.set("n", "<space>a", rt.hover_actions.hover_actions, { buffer = bufnr })
            end,
          },
        })
      end
    end,
  },

}
