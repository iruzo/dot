return {

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { 'nvim-lua/plenary.nvim', version = '*' },
      'nvim-treesitter/nvim-treesitter',
      { 'github/copilot.vim', version = '*', cmd = 'Copilot' },
    },
    cmd = {
      'CodeCompanion',
      'CodeCompanionActions',
      'CodeCompanionChat',
      'CodeCompanionCmd'
    },
    config = function()
      local function is_copilot_available()
        if vim.g.copilot_token and vim.g.copilot_token ~= "" then
          return true
        end
        local token = os.getenv("GITHUB_COPILOT_TOKEN")
        if token and token ~= "" then
          return true
        end
        return false
      end

      local selected_adapter = is_copilot_available() and "copilot" or "deepseek"

      require("codecompanion").setup({
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              -- Copilot-specific configurations (if any)
            })
          end,
          deepseek = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://localhost:50001",
              },
              headers = {
                ["Content-Type"] = "application/json",
              },
              schema = {
                model = { default = "deepseek-r1:1.5b" },
              },
            })
          end,
        },
        strategies = {
          chat   = { adapter = selected_adapter },
          inline = { adapter = selected_adapter },
          agent  = { adapter = selected_adapter },
        },
      })
    end,
  }

}
