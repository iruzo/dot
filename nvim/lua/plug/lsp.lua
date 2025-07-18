return {

  {
    'neovim/nvim-lspconfig',
    version = '*',
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
            tag = 'stable',
            build = ':MasonUpdate',
            -- opts = true,
            config = function()
              require'mason'.setup {
                PATH = "append",
              }
            end,
          },
        },
        config = function()
          require'mason-lspconfig'.setup({
            -- automatic_installation = true,
            handlers = {
              function (server_name)
                require'lspconfig'[server_name].setup {
                  capabilities = require'cmp_nvim_lsp'.default_capabilities()
                }
              end,
            },
          })
        end
      },
      {
        'mrcjkb/rustaceanvim',
        version = '*',
        ft = { 'rust' },
        cond = function()
          local f=io.open('Cargo.toml','r')
          if f~=nil then io.close(f)
            return true
          end
        end,
      },
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-nvim-lua',
          'hrsh7th/cmp-buffer',
          'rasulomaroff/cmp-bufname',
          'amarakon/nvim-cmp-buffer-lines',
          {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
              {
                'L3MON4D3/LuaSnip',
                version = '*',
                dependencies = {
                  'rafamadriz/friendly-snippets',
                  'iruzo/snip',
                },
                config = function()
                  require'luasnip.loaders.from_vscode'.lazy_load()
                  require'luasnip.loaders.from_snipmate'.lazy_load({ paths = vim.fn.stdpath('data') .. "/lazy/snip" })
                end,
              }
            }
          },
          'onsails/lspkind.nvim',
        },
        config = function(args)
          local cmp = require'cmp'
          local lspkind = require'lspkind'
          cmp.setup {
            window = {
              completion = {
                border = 'rounded',
              },
              documentation = {
                border = 'rounded',
              },
            },
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
              { name = 'nvim_lua' },
              { name = 'vim-dadbod-completion' },
              { name = 'path' },
              { name = 'codecompanion' },
              { name = 'buffer' },
            }, {
                { name = 'buffer-name' },
                { name = 'buffer-lines' },
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
            formatting = {
              format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                ellipsis_char = '...',
                show_labelDetails = true,
                before = function (entry, vim_item)
                  return vim_item
                end
              })
            }
          }
          cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'nvim_lsp_document_symbol' },
            }, {
              { name = 'buffer' },
            }),
          })
          cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
          })
        end
      },
    },
    config = function()

      vim.diagnostic.config {
        float = { border = "rounded" },
      }

      vim.keymap.set('n',          'gm',    ':lua vim.lsp.buf.hover()<CR>',    { desc = '' })
      vim.keymap.set('n',          'ge',    ':lua vim.lsp.buf.rename()<CR>',   { desc = '' })
      -- vim.keymap.set('n', 'gi',    ':lua vim.lsp.buf.implementation()<CR>',    { desc = '' })
      -- vim.keymap.set('n', 'gd',    ':lua vim.lsp.buf.definition()<CR>',        { desc = '' })
      -- vim.keymap.set('n', 'gr',    ':lua vim.lsp.buf.references()<CR>',        { desc = '' })
      vim.keymap.set('n', 'gi',    ':Telescope lsp_implementations<CR>',       { desc = '' })
      vim.keymap.set('n', 'gd',    ':Telescope lsp_definitions<CR>',           { desc = '' })
      vim.keymap.set('n', 'gD',    ':lua vim.lsp.buf.declaration()<CR>',       { desc = '' })
      vim.keymap.set('n', 'gr',    ':Telescope lsp_references<CR>',            { desc = '' })
      vim.keymap.set('n', '<C-a>', ':lua vim.lsp.buf.code_action()<CR>',       { desc = '' })
      vim.keymap.set('x', '<C-a>', ':lua vim.lsp.buf.range_code_action()<CR>', { desc = '' })
      vim.keymap.set('n', '<M-d>', ':lua vim.diagnostic.open_float()<CR>',     { desc = '' })
      vim.keymap.set('n', '<M-p>', ':lua vim.diagnostic.goto_prev()<CR>',      { desc = '' })
      vim.keymap.set('n', '<M-n>', ':lua vim.diagnostic.goto_next()<CR>',      { desc = '' })

    end
  },

}
