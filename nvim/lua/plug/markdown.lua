return {

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
      {
        'echasnovski/mini.icons',
        version = false,
        opts = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
      }
    },
    opts = {
      pipe_table = {
        enabled = false,
      },
    },
  },

  {
    'iamcco/markdown-preview.nvim', -- Error on NixOS when using prebuilt binary: https://github.com/iamcco/markdown-preview.nvim/issues/366
    version = '*',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = 'markdown',
    build = ':call mkdp#util#install()',
    config = function()
      vim.g.mkdp_page_title = ''
      vim.g.mkdp_theme = 'light'
      vim.g.mkdp_preview_options = { disable_filename = 1 }

      local uv = vim.uv or vim.loop

      local function chromium_bin()
        if vim.fn.executable('chromium') == 1 then return 'chromium' end
        if vim.fn.executable('chromium-browser') == 1 then return 'chromium-browser' end
        return nil
      end

      local function safe_jobstart(cmd, opts)
        local ok, jobid = pcall(vim.fn.jobstart, cmd, opts or {})
        if not ok then return -1 end
        return jobid
      end

      function _G.__mkdp_open(url)
        local bin = chromium_bin()
        if not bin then
          vim.notify('markdown-preview: chromium/chromium-browser not found in PATH', vim.log.levels.ERROR)
          return
        end

        local tried_wayland = false
        local t0 = uv.hrtime()

        local function start_wayland()
          tried_wayland = true
          safe_jobstart({
            bin,
            '--no-sandbox',
            '--ozone-platform=wayland',
            '--enable-features=UseOzonePlatform',
            '--new-window',
            url,
          }, {
            detach = true,
            env = { NIXOS_OZONE_WL = '1' },
          })
        end

        -- First try: plain chromium
        local jobid = safe_jobstart({ bin, '--new-window', url }, {
          detach = false,
          on_exit = function(_, code, _)
            local elapsed_s = (uv.hrtime() - t0) / 1e9
            if (not tried_wayland) and code ~= 0 and elapsed_s < 2.0 then
              start_wayland()
            end
          end,
        })

        -- If it couldn't start at all, fallback immediately
        if jobid <= 0 then
          start_wayland()
        end
      end

      -- mkdp expects a Vimscript function name; wrap the Lua function.
      vim.cmd([[
        function! OpenMarkdownPreview(url) abort
          call v:lua.__mkdp_open(a:url)
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

      local this_file = debug.getinfo(1, 'S').source:sub(2)
      local plug_dir = vim.fn.fnamemodify(this_file, ':p:h')
      vim.g.mkdp_markdown_css = plug_dir .. '/markdown.css'
    end
  },

  {
    "ellisonleao/glow.nvim",
    version = '*',
    ft = 'markdown',
    config = function()
      require'glow'.setup({
        border = "rounded",
      })
    end
  }

}
