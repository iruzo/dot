return {

  {
    'nvim-neotest/neotest',
    version = '*',
    cmd = 'Neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'marilari88/neotest-vitest',
      'olimorris/neotest-rspec',
    },
    -- keys = {
      -- { '<leader>dtt', ":lua require'neotest'.run.run({strategy = 'dap'})<cr>", desc = '[t]est' },
      -- { '<leader>dts', ":lua require'neotest'.run.stop()<cr>", desc = '[s]top test' },
      -- { '<leader>dta', ":lua require'neotest'.run.attach()<cr>", desc = '[a]ttach test' },
      -- { '<leader>dtf', ":lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", desc = 'test [f]ile' },
      -- { '<leader>dts', ":lua require'neotest'.summary.toggle()<cr>", desc = 'test [s]ummary' },
      -- vim.keymap.set('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<CR>', { desc = '[T]est [N]earest' })
      -- vim.keymap.set('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%s"))<CR>', { desc = '[T]est [F]ile' })
      -- vim.keymap.set('n', '<leader>ta', '<cmd>lua require("neotest").run.run({ suite = true })<CR>', { desc = '[T]est [A]ll' })
      -- vim.keymap.set('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<CR>', { desc = '[T]est [S]ummary' })
      -- vim.keymap.set('n', '<leader>to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>', { desc = '[T]est [O]utput' })
    -- }
    opts = {
      adapters = {
      },
      quickfix = {
        enabled = false,
        open = false,
      },
      summary = {
        open = [[botright vsplit +set\ nowrap | vertical resize 50]],
      },
      icons = {
        running_animated = {
          '⠋',
          '⠙',
          '⠹',
          '⠸',
          '⠼',
          '⠴',
          '⠦',
          '⠧',
          '⠇',
          '⠏',
        },
      },
      status = { enabled = true, virtual_text = true, signs = false },
    },
  }

}
