vim.keymap.set('n',          'gm',    ':lua vim.lsp.buf.hover()<CR>',    { desc = '' })
vim.keymap.set('n',          'ge',    ':lua vim.lsp.buf.rename()<CR>',   { desc = '' })
-- vim.keymap.set('n', 'gi',    ':lua vim.lsp.buf.implementation()<CR>',    { desc = '' })
-- vim.keymap.set('n', 'gd',    ':lua vim.lsp.buf.definition()<CR>',        { desc = '' })
-- vim.keymap.set('n', 'gr',    ':lua vim.lsp.buf.references()<CR>',        { desc = '' })
vim.keymap.set('n', 'gD',    ':lua vim.lsp.buf.declaration()<CR>',       { desc = '' })
vim.keymap.set('n', '<C-a>', ':lua vim.lsp.buf.code_action()<CR>',       { desc = '' })
vim.keymap.set('x', '<C-a>', ':lua vim.lsp.buf.code_action()<CR>',       { desc = '' })
vim.keymap.set('n', '<C-m>', ':lua vim.lsp.buf.hover()<CR>',             { desc = '' })
vim.keymap.set('n', '<M-d>', ':lua vim.diagnostic.open_float()<CR>',     { desc = '' })

local notified_lsp = {}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil or notified_lsp[client.id] then
      return
    end

    notified_lsp[client.id] = true

    vim.notify(
      'LSP running: ' .. client.name,
      vim.log.levels.INFO,
      { title = 'LSP' }
    )
  end,
})

return {

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = 'Mason',
    opts = {
      PATH = "prepend",
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    cmd = "Ide",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {},
      automatic_enable = true,
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)
      vim.api.nvim_create_user_command('Ide', function() end, {
        desc = 'Load IDE support',
        force = true,
      })
    end,
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    config = function()
      require'tiny-inline-diagnostic'.setup({
        vim.diagnostic.config({
          virtual_text = false,
          underline = false,
        }),
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
        },
      })
    end,
  },

  -- {
  --   'JavaHello/spring-boot.nvim',
  --   ft = {"java", "yaml", "jproperties"},
  --   cond = function()
  --     local f=io.open('pom.xml','r')
  --     if f~=nil then io.close(f)
  --       return true
  --     end
  --   end,
  --   dependencies = {
  --     {
  --       'nvim-java/nvim-java',
  --       version = "*",
  --       config = function()
  --         require'java'.setup()
  --       end,
  --     },
  --   },
  --   opts = {}
  -- },

  {
    'mfussenegger/nvim-dap',
    version = '*',
    cmd = 'DapToggleBreakpoint',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = function() require'nvim-dap-virtual-text'.setup() end },
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        config = function() require'dapui'.setup() end
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        opts = {
          automatic_installation = true,
          ensure_installed = { 'netcoredbg' },
          handlers = {},
        },
      },
    },
    config = function()
      local dap = require('dap')
      local netcoredbg = vim.fn.exepath('netcoredbg')
      if netcoredbg == '' then
        netcoredbg = 'netcoredbg'
      end
      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbg,
        args = { '--interpreter=vscode' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch project dll',
          request = 'launch',
          program = function()
            local default = vim.fn.getcwd() .. '/bin/Debug/'
            return vim.fn.input('Path to dll: ', default, 'file')
          end,
        },
      }
      local dapui = require('dapui')
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
    keys = {
      { '<F1>', ':DapToggleBreakpoint<CR>',          silent = true, desc = 'dap toggle breakpoint' },
      { '<F2>', ':lua require"dap".step_over()<CR>', silent = true, desc = 'dap step over' },
      { '<F3>', ':lua require"dap".step_back()<CR>', silent = true, desc = 'dap step back' },
      { '<F4>', ':lua require"dap".step_into()<CR>', silent = true, desc = 'dap step into' },
      { '<F5>', ':lua require"dap".step_out()<CR>',  silent = true, desc = 'dap step out' },
      { '<F6>', ':lua require"dap".continue()<CR>',  silent = true, desc = 'dap continue' },
      { '<F7>', ':lua require"dap".terminate()<CR>', silent = true, desc = 'dap terminate' },
      { '<F9>', ':lua require"dapui".toggle()<CR>',  silent = true, desc = 'dap toggle ui' },
    },
  },

}
