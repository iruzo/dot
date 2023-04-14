return {
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- basic
  'lewis6991/impatient.nvim',
  'nvim-lua/plenary.nvim', --lua functions for addons

  -- general
  {
    'folke/which-key.nvim',
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
    config = function()
      vim.api.nvim_set_keymap('n', '<space>s', ':HopChar1<CR>', { noremap = true })
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
    config = function()
      vim.api.nvim_set_keymap('n', '<space>h', ':Telescope live_grep<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>f', ':Telescope find_files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>b', ':Telescope buffers<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>t', ':Telescope diagnostics<CR>', { noremap = true })
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            -- linux
            '.git/', '.cache/', '.local/', 'venv/', 'svn/',
            -- windows
            '.git\\', '.cache\\', '.local\\', 'venv\\', 'svn\\'
          }
        },
        pickers = {
          find_files = {
            hidden = 'true'
          },
          find_files = {
            theme = "ivy",
          }
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
    config = function()
      vim.api.nvim_set_keymap('n', '<space>e', ':NeoTreeRevealToggle<CR>', { noremap = true })
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
  -- {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup {
  --       -- transparent_background = true,
  --       flavour = "mocha", -- mocha, macchiato, frappe, latte
  --     }
  --     vim.api.nvim_command "colorscheme catppuccin"
  --   end
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.api.nvim_command "colorscheme gruvbox"
    end
  },
  { 'nvim-lualine/lualine.nvim', event = "BufRead", config = function() require("lualine").setup() end },
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
  { -- highlight
    'nvim-treesitter/nvim-treesitter',
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
  { -- after doesn't work inside require
    'nvim-treesitter/nvim-treesitter-context',
    after = "nvim-treesitter",
  },
  {
    'norcalli/nvim-colorizer.lua',
    -- event = "BufRead",
    cmd = { 'ColorizerToggle' },
    config = function() require("colorizer").setup() end,
  }, --show colors in code

  --git
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

  --dap
  {
    'mfussenegger/nvim-dap',
    event = "BufRead",
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      { 'rcarriga/nvim-dap-ui', config = function() require'dapui'.setup() end },
      {
        'jayp0521/mason-nvim-dap.nvim',
        config = function()
          vim.api.nvim_set_keymap('n', 'W', '<Plug>(DBUI_SaveQuery)', { noremap = true })
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

  --db
  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = 'DBUI',
    dependencies = {
      {
        'tpope/vim-dadbod',
        config = function() vim.g.db_ui_save_location = '~/.local/data/nvim/dbui' end,
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
      vim.api.nvim_set_keymap('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true }) --open code actions using the default lsp UI
      vim.api.nvim_set_keymap('x', 'ca', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true }) --open code actions for the selected visual range

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

}
