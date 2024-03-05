return {

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
        dependencies = {
          {
            'williamboman/mason.nvim',
            tag = 'stable',
            build = ':MasonUpdate',
            opts = true,
          },
        },
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
