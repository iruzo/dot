return {

  -- { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'tzachar/cmp-tabnine', build = 'powershell ./install.ps1', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'codota/tabnine-nvim', build = './dl_binaries.sh' },
  -- { 'https://github.com/jpmcb/nvim-llama' }

  {
    'zbirenbaum/copilot.lua',
    cmd = {
      "Copilot",
      "CopilotChat",
    },
    dependencies = {
      {
        'CopilotC-Nvim/CopilotChat.nvim',
        event = "VeryLazy",
        tag = 'stable',
        build = function()
          vim.cmd("UpdateRemotePlugins") -- You need to restart to make it works
        end,
        opts = true,
        keys = {
          { "<leader>ce", "<cmd>CopilotChatExplain<cr>",  desc = "CopilotChat - Explain code" },
          { "<leader>ct", "<cmd>CopilotChatTests<cr>",    desc = "CopilotChat - Generate tests" },
          { "<leader>cr", "<cmd>CopilotChatReview<cr>",   desc = "CopilotChat - Review code" },
          { "<leader>ci", "<cmd>CopilotChatInPlace<cr>",   desc = "CopilotChat - Chat in place" },
          { "<leader>cR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
        }
      }
    },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-Enter>",
          },
        }
      })
    end
  },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- }

  -- {
  --   'jackMort/ChatGPT.nvim',
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "echo api-key",
  --     })
  --   end,
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim'
  --   }
  -- }

  -- {
  --   'WhiteBlackGoose/gpt4all.nvim',
  --   cmd = {
  --     'ChatGPT',
  --     'ChatGPTActAs',
  --     'ChatGPTCompleteCode',
  --     'ChatGPTEditWithInstructions',
  --     'ChatGPTRun',
  --   },
  --   opts = true,
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim'
  --   },
  -- },

}
