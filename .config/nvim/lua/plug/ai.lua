return {

  -- { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'tzachar/cmp-tabnine', build = 'powershell ./install.ps1', dependencies = 'hrsh7th/nvim-cmp', }
  -- { 'codota/tabnine-nvim', build = './dl_binaries.sh' },

  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
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

  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }

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
