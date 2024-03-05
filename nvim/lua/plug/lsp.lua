return {

  {
    'neovim/nvim-lspconfig',
    version = '*',
    event = 'VeryLazy',
    dependencies = {

      {
        'mrcjkb/rustaceanvim',
        version = '*',
        ft = { 'rust' },
      },

      {
        'nvim-java/nvim-java',
        version = "*",
        cond = function()
          local f=io.open('pom.xml','r')
          if f~=nil then io.close(f)
            return true
          end
        end,
        config = function()
          require'java'.setup()
        end,
      },

      {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'LspAttach',
        config = function()
          require'tiny-inline-diagnostic'.setup({
            vim.diagnostic.config({ virtual_text = false }),
            options = {
              show_source = {
                enabled = false,
                if_many = false,
              },
              use_icons_from_diagnostic = true,
              multilines = {
                enabled = true,
                always_show = true,
                trim_whitespaces = false,
                tabstop = 4,
              },
            }
          })
        end
      }

    },
    config = function()
      vim.lsp.enable({
        'marksman',
        'pyright',
        'pylsp',
        'rust-analyzer',
        'jdtls',
      })

      vim.diagnostic.config {
        float = { border = "rounded" },
        virtual_text = false
      }

      vim.keymap.set('n',          'gm',    ':lua vim.lsp.buf.hover()<CR>',    { desc = '' })
      vim.keymap.set('n',          'ge',    ':lua vim.lsp.buf.rename()<CR>',   { desc = '' })
      -- vim.keymap.set('n', 'gi',    ':lua vim.lsp.buf.implementation()<CR>',    { desc = '' })
      -- vim.keymap.set('n', 'gd',    ':lua vim.lsp.buf.definition()<CR>',        { desc = '' })
      -- vim.keymap.set('n', 'gr',    ':lua vim.lsp.buf.references()<CR>',        { desc = '' })
      vim.keymap.set('n', 'gD',    ':lua vim.lsp.buf.declaration()<CR>',       { desc = '' })
      vim.keymap.set('n', '<C-a>', ':lua vim.lsp.buf.code_action()<CR>',       { desc = '' })
      vim.keymap.set('x', '<C-a>', ':lua vim.lsp.buf.range_code_action()<CR>', { desc = '' })
      vim.keymap.set('n', '<C-m>', ':lua vim.lsp.buf.hover()<CR>',             { desc = '' })
      vim.keymap.set('n', '<M-d>', ':lua vim.diagnostic.open_float()<CR>',     { desc = '' })

    end,
  }

}
