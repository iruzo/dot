return {

  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      }
    },
    dependencies = {
      {
        'echasnovski/mini.icons',
        version = false,
        opts = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
      },
    },
  },

  {
    'echasnovski/mini.files',
    version = '*',
    dependencies = {
      {
        'echasnovski/mini.icons',
        version = false,
        opts = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
      },
    },
    keys = {
      { '<leader>e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>', silent = true, desc = 'File Explorer' },
    },
    config = function()
      require("mini.files").setup({
        windows = {
          width_focus = 50,
          width_preview = 100,
          preview = true
        },
      })
      local MiniFiles = require("mini.files")

      local function open_with_default_app()
        local path = MiniFiles.get_fs_entry().path
        if vim.fn.has('macunix') == 1 then
          vim.fn.jobstart({ 'open', path }, { detach = true })
        elseif vim.fn.has('unix') == 1 then
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        elseif vim.fn.has('win32') == 1 then
          vim.fn.jobstart({ 'start', path }, { detach = true })
        else
          print("Unsupported OS")
        end
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          vim.keymap.set('n', 'gl', open_with_default_app, { desc = "Open with default app" })
        end,
      })

      local function open_current_directory_in_file_explorer()
        local path = vim.fs.dirname(MiniFiles.get_fs_entry().path)
        if vim.fn.has('macunix') == 1 then
          vim.fn.jobstart({ 'open', path }, { detach = true })
        elseif vim.fn.has('unix') == 1 then
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        elseif vim.fn.has('win32') == 1 then
          vim.fn.jobstart({ 'start', path }, { detach = true })
        else
          print("Unsupported OS")
        end
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          vim.keymap.set('n', '<leader>l', open_current_directory_in_file_explorer, { desc = "Open current directory in file browser" })
        end,
      })

      local nsMiniFiles = vim.api.nvim_create_namespace("mini_files_git")
      local autocmd = vim.api.nvim_create_autocmd
      local _, MiniFiles = pcall(require, "mini.files")

      -- Cache for git status
      local gitStatusCache = {}
      local cacheTimeout = 2000 -- Cache timeout in milliseconds

      local function mapSymbols(status)
        local statusMap = {
          [" M"] = { symbol = "", hlGroup = "MiniDiffSignChange" }, -- Modified in the working directory
          ["M "] = { symbol = "", hlGroup = "MiniDiffSignAdd" }, -- modified in index
          ["MM"] = { symbol = "", hlGroup = "MiniDiffSignChange" }, -- modified in both working tree and index
          ["A "] = { symbol = "", hlGroup = "MiniDiffSignAdd" }, -- Added to the staging area, new file
          ["AA"] = { symbol = "≈", hlGroup = "MiniDiffSignAdd" }, -- file is added in both working tree and index
          ["D "] = { symbol = "-", hlGroup = "MiniDiffSignDelete" }, -- Deleted from the staging area
          ["AM"] = { symbol = "⊕", hlGroup = "MiniDiffSignChange" }, -- added in working tree, modified in index
          ["AD"] = { symbol = "-•", hlGroup = "MiniDiffSignChange" }, -- Added in the index and deleted in the working directory
          ["R "] = { symbol = "→", hlGroup = "MiniDiffSignChange" }, -- Renamed in the index
          ["U "] = { symbol = "‖", hlGroup = "MiniDiffSignChange" }, -- Unmerged path
          ["UU"] = { symbol = "⇄", hlGroup = "MiniDiffSignAdd" }, -- file is unmerged
          ["UA"] = { symbol = "⊕", hlGroup = "MiniDiffSignAdd" }, -- file is unmerged and added in working tree
          ["??"] = { symbol = "", hlGroup = "MiniDiffSignDelete" }, -- Untracked files
          ["!!"] = { symbol = "", hlGroup = "MiniDiffSignChange" }, -- Ignored files
        }

        local result = statusMap[status] or { symbol = "?", hlGroup = "NonText" }
        return result.symbol, result.hlGroup
      end

      ---@param cwd string
      ---@param callback function
      local function fetchGitStatus(cwd, callback)
        local function on_exit(content)
          if content.code == 0 then
            callback(content.stdout)
            vim.g.content = content.stdout
          end
        end
        vim.system({ "git", "status", "--ignored", "--porcelain" }, { text = true, cwd = cwd }, on_exit)
      end

      local function escapePattern(str)
        return str:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
      end

      local function updateMiniWithGit(buf_id, gitStatusMap)
        vim.schedule(function()
          local nlines = vim.api.nvim_buf_line_count(buf_id)
          local cwd = vim.fn.getcwd()
          local escapedcwd = escapePattern(cwd)
          if vim.fn.has("win32") == 1 then
            escapedcwd = escapedcwd:gsub("\\", "/")
          end

          for i = 1, nlines do
            local entry = MiniFiles.get_fs_entry(buf_id, i)
            if not entry then
              break
            end
            local relativePath = entry.path:gsub("^" .. escapedcwd .. "/", "")
            local status = gitStatusMap[relativePath]

            if status then
              local symbol, hlGroup = mapSymbols(status)
              vim.api.nvim_buf_set_extmark(buf_id, nsMiniFiles, i - 1, 0, {
                sign_text = symbol,
                sign_hl_group = hlGroup,
                priority = 2,
              })
            else
            end
          end
        end)
      end

      local function is_valid_git_repo()
        if vim.fn.isdirectory(".git") == 0 then
          return false
        end
        return true
      end

      -- Thanks for the idea of gettings https://github.com/refractalize/oil-git-status.nvim signs for dirs
      local function parseGitStatus(content)
        local gitStatusMap = {}
        -- lua match is faster than vim.split (in my experience )
        for line in content:gmatch("[^\r\n]+") do
          local status, filePath = string.match(line, "^(..)%s+(.*)")
          -- Split the file path into parts
          local parts = {}
          for part in filePath:gmatch("[^/]+") do
            table.insert(parts, part)
          end
          -- Start with the root directory
          local currentKey = ""
          for i, part in ipairs(parts) do
            if i > 1 then
              -- Concatenate parts with a separator to create a unique key
              currentKey = currentKey .. "/" .. part
            else
              currentKey = part
            end
            -- If it's the last part, it's a file, so add it with its status
            if i == #parts then
              gitStatusMap[currentKey] = status
            else
              -- If it's not the last part, it's a directory. Check if it exists, if not, add it.
              if not gitStatusMap[currentKey] then
                gitStatusMap[currentKey] = status
              end
            end
          end
        end
        return gitStatusMap
      end

      local function updateGitStatus(buf_id)
        if not is_valid_git_repo() then
          return
        end
        local cwd = vim.fn.getcwd()
        local currentTime = os.time()
        if gitStatusCache[cwd] and currentTime - gitStatusCache[cwd].time < cacheTimeout then
          updateMiniWithGit(buf_id, gitStatusCache[cwd].statusMap)
        else
          fetchGitStatus(cwd, function(content)
            local gitStatusMap = parseGitStatus(content)
            gitStatusCache[cwd] = {
              time = currentTime,
              statusMap = gitStatusMap,
            }
            updateMiniWithGit(buf_id, gitStatusMap)
          end)
        end
      end

      local function clearCache()
        gitStatusCache = {}
      end

      local function augroup(name)
        return vim.api.nvim_create_augroup("MiniFiles_" .. name, { clear = true })
      end

      autocmd("User", {
        group = augroup("start"),
        pattern = "MiniFilesExplorerOpen",
        -- pattern = { "minifiles" },
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          updateGitStatus(bufnr)
        end,
      })

      autocmd("User", {
        group = augroup("close"),
        pattern = "MiniFilesExplorerClose",
        callback = function()
          clearCache()
        end,
      })

      autocmd("User", {
        group = augroup("update"),
        pattern = "MiniFilesBufferUpdate",
        callback = function(sii)
          local bufnr = sii.data.buf_id
          local cwd = vim.fn.getcwd()
          if gitStatusCache[cwd] then
            updateMiniWithGit(bufnr, gitStatusCache[cwd].statusMap)
          end
        end,
      })
    end,
  },

}
