return {

  {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.6',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
    dependencies = {
      {
        'dnlhc/glance.nvim',
        opts = true,
        keys = {
          { 'glr', ':Glance references<CR>',  silent = true, desc = 'lsp references' },
          { 'gld', ':Glance definitions<CR>', silent = true, desc = 'lsp definitions' },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        tag = 'stable',
        cmd = { 'LspInstall', 'LspUninstall' },
        dependencies = {
          {
            'williamboman/mason.nvim',
            tag = 'v1.5.0',
            build = ':MasonUpdate',
            opts = true,
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
        'simrat39/rust-tools.nvim',
        cond = function()
          local f=io.open('Cargo.toml','r')
          if f~=nil then io.close(f)
            return true
          end
        end,
        opts = true,
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
                tag = 'v2.0.0',
                dependencies = {
                  'rafamadriz/friendly-snippets',
                  {
                    'iruzo/pxmenu',
                    cond = false,
                  },
                },
                config = function()
                  require'luasnip.loaders.from_vscode'.lazy_load()
                  -- require'luasnip.loaders.from_snipmate'.lazy_load({ paths = { "./my-cool-snippets" } })
                end,
              }
            }
          },
        },
        config = function(args)
          local cmp = require'cmp'
          require'cmp'.setup {
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
      vim.api.nvim_set_keymap('n', 'mm',       ':lua vim.lsp.buf.hover()<CR>',             { noremap = true })
      vim.api.nvim_set_keymap('n', 'gd',       ':lua vim.lsp.buf.definition()<CR>',        { noremap = true })
      vim.api.nvim_set_keymap('n', 'gi',       ':lua vim.lsp.buf.implementation()<CR>',    { noremap = true })
      vim.api.nvim_set_keymap('n', 'gr',       ':lua vim.lsp.buf.references()<CR>',        { noremap = true })
      vim.api.nvim_set_keymap('n', 'rr',       ':lua vim.lsp.buf.rename()<CR>',            { noremap = true })
      vim.api.nvim_set_keymap('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>',       { noremap = true })
      vim.api.nvim_set_keymap('x', '<space>a', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<M-p>',    ':lua vim.diagnostic.goto_prev()<CR>',      { noremap = true })
      vim.api.nvim_set_keymap('n', '<M-n>',    ':lua vim.diagnostic.goto_next()<CR>',      { noremap = true })
    end
  },

}
