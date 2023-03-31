return {
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- basic
  'lewis6991/impatient.nvim',
  'nvim-lua/plenary.nvim', --lua functions for addons

  -- general
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
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 1000000,
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
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
    cmd = 'NeoTreeRevealToggle',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },
  { 'sanfusu/neovim-undotree', cmd = 'UndotreeToggle' },

  -- visual
  -- {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup {
  --       -- transparent_background = true,
  --       flavour = "frappe", -- mocha, macchiato, frappe, latte
  --     }
  --     vim.api.nvim_command "colorscheme catppuccin"
  --   end
  -- }
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
  { 'nanozuki/tabby.nvim', event = "BufRead", config = function() require('tabby.tabline').set() end },
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
        require('gitsigns').setup {
          current_line_blame = true
        }
      end
    end,
  },

  --dap
  {
    'mfussenegger/nvim-dap',
    cmd = "DapToggleBreakpoint",
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      { 'rcarriga/nvim-dap-ui', config = function() require'dapui'.setup() end },
      {
        'jayp0521/mason-nvim-dap.nvim',
        config = function()
          require'mason-nvim-dap'.setup({ automatic_setup = true })
          require'mason-nvim-dap'.setup_handlers {
            function(source_name)
              require('mason-nvim-dap.automatic_setup')(source_name)
            end,
          }
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
  -- { 'tzachar/cmp-tabnine', run = './install.sh', config = 'require("cmp_tabnine.config")' }
  --

  {
    'VonHeikemen/lsp-zero.nvim',
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
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      })
      cmp.setup({experimental = { ghost_text = true }})

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        --lsp
        vim.api.nvim_set_keymap('n', 'mm', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', 'rr', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
      end)

      lsp.setup()
    end
  },

}
